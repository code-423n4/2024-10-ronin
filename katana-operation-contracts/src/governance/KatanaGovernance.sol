// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import { EnumerableSet } from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import { Address } from "@openzeppelin/contracts/utils/Address.sol";
import { IKatanaV3Factory } from "@katana/v3-contracts/core/interfaces/IKatanaV3Factory.sol";
import { IKatanaV2Factory } from "./interfaces/IKatanaV2Factory.sol";
import { IKatanaV2Pair } from "@katana/v3-contracts/periphery/interfaces/IKatanaV2Pair.sol";
import { IKatanaGovernance } from "@katana/v3-contracts/external/interfaces/IKatanaGovernance.sol";

contract KatanaGovernance is OwnableUpgradeable, IKatanaV2Factory, IKatanaGovernance {
  using EnumerableSet for EnumerableSet.AddressSet;

  /// @dev Revert error when the length of the array is invalid.
  error InvalidLength();
  /// @dev Revert error when the caller is not authorized.
  error Unauthorized();

  /// @dev Gap for upgradeability.
  uint256[50] private __gap;

  /// @dev Indicates the token is unauthorized for trade.
  uint40 private constant UNAUTHORIZED = 0;
  /// @dev Indicates the token is publicly allowed for trade.
  uint40 private constant AUTHORIZED = type(uint40).max;

  /// @dev The v2 factory contract.
  IKatanaV2Factory private _v2Factory;
  /// @dev The mapping of token to permission.
  mapping(address token => Permission) private _permission;
  /// @dev The unique set of tokens.
  EnumerableSet.AddressSet private _tokens;

  /// @inheritdoc IKatanaGovernance
  /// @dev The mapping of allowed actors.
  mapping(address actor => bool) public isAllowedActor;

  /// @dev The v3 factory address.
  IKatanaV3Factory private _v3Factory;
  /// @dev The position manager address.
  address private _positionManager;

  /// @dev The router address.
  address private _router;

  constructor() {
    _disableInitializers();
  }

  function initialize(address admin, address factory) external initializer {
    _setFactory(factory);
    __Ownable_init_unchained(admin);

    IKatanaV2Pair pair;
    uint40 until = AUTHORIZED;
    bool[] memory statusesPlaceHolder;
    address[] memory allowedPlaceHolder;
    uint256 length = IKatanaV2Factory(factory).allPairsLength();

    for (uint256 i; i < length; ++i) {
      pair = IKatanaV2Pair(IKatanaV2Factory(factory).allPairs(i));
      _setPermission(pair.token0(), until, allowedPlaceHolder, statusesPlaceHolder);
      _setPermission(pair.token1(), until, allowedPlaceHolder, statusesPlaceHolder);
    }
  }

  function initializeV2(
    address v3Factory,
    address positionManager,
    address v3Migrator,
    address legacyPermissionedRouter,
    address aggregateRouter
  ) external reinitializer(2) {
    _v3Factory = IKatanaV3Factory(v3Factory);
    _positionManager = positionManager;

    _setRouter(aggregateRouter);

    _setAllowedActor(v3Migrator, true);
    _setAllowedActor(legacyPermissionedRouter, true);
    _setAllowedActor(aggregateRouter, true);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function setRouter(address router) external onlyOwner {
    _setRouter(router);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function setAllowedActor(address actor, bool allowed) external onlyOwner {
    _setAllowedActor(actor, allowed);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function toggleFlashLoanPermission() external onlyOwner {
    _v3Factory.toggleFlashLoanPermission();
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function enableFeeAmount(uint24 fee, int24 tickSpacing, uint8 feeProtocolNum, uint8 feeProtocolDen)
    external
    onlyOwner
  {
    _v3Factory.enableFeeAmount(fee, tickSpacing, feeProtocolNum, feeProtocolDen);
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function createPair(address tokenA, address tokenB) external returns (address pair) {
    address sender = _msgSender();
    address[] memory tokens = new address[](2);
    tokens[0] = tokenA;
    tokens[1] = tokenB;
    if (!isAuthorized(tokens, sender)) revert Unauthorized();

    pair = _v2Factory.createPair(tokenA, tokenB);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function createPairAndSetPermission(
    address tokenA,
    address tokenB,
    uint40 whitelistUntil,
    address[] calldata alloweds,
    bool[] calldata statuses
  ) external onlyOwner returns (address pair) {
    pair = _v2Factory.createPair(tokenA, tokenB);
    _setPermission(tokenA, whitelistUntil, alloweds, statuses);
    _setPermission(tokenB, whitelistUntil, alloweds, statuses);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function setPermission(address token, uint40 whitelistUntil, address[] calldata alloweds, bool[] calldata statuses)
    external
    onlyOwner
  {
    _setPermission(token, whitelistUntil, alloweds, statuses);
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function setPairImplementation(address impl) external onlyOwner {
    _v2Factory.setPairImplementation(impl);
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function setAllowedAll(bool shouldAllow) external onlyOwner {
    _v2Factory.setAllowedAll(shouldAllow);
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function setTreasury(address newTreasury) external onlyOwner {
    _v2Factory.setTreasury(newTreasury);
    _v3Factory.setTreasury(newTreasury);
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function getPair(address tokenA, address tokenB) external view returns (address pair) {
    return _v2Factory.getPair(tokenA, tokenB);
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function allPairs(uint256 index) external view returns (address pair) {
    return _v2Factory.allPairs(index);
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function allPairsLength() external view returns (uint256) {
    return _v2Factory.allPairsLength();
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function treasury() external view returns (address) {
    return _v2Factory.treasury();
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function pairImplementation() external view returns (address) {
    return _v2Factory.pairImplementation();
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function INIT_CODE_PAIR_HASH() external view returns (bytes32) {
    return _v2Factory.INIT_CODE_PAIR_HASH();
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function getRouter() external view returns (address) {
    return _router;
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function getV2Factory() external view returns (address) {
    return address(_v2Factory);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function getV3Factory() external view override returns (address) {
    return address(_v3Factory);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function getPositionManager() external view override returns (address) {
    return _positionManager;
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function isAuthorized(address token, address account) public view returns (bool authorized) {
    if (_isSkipped(account)) return true;

    authorized = _isAuthorized(_permission[token], account);
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function isAuthorized(address[] memory tokens, address account) public view returns (bool authorized) {
    if (_isSkipped(account)) return true;

    uint256 length = tokens.length;
    for (uint256 i; i < length; ++i) {
      if (!_isAuthorized(_permission[tokens[i]], account)) return false;
    }

    return true;
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function getWhitelistUntil(address token) external view returns (uint40) {
    return _permission[token].whitelistUntil;
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function getWhitelistedTokensFor(address account)
    external
    view
    returns (address[] memory tokens, uint40[] memory whitelistUntils)
  {
    unchecked {
      uint256 length = _tokens.length();
      tokens = new address[](length);
      whitelistUntils = new uint40[](length);
      uint256 count;
      address token;
      uint40 whitelistUntil;
      Permission storage $;

      for (uint256 i; i < length; ++i) {
        token = _tokens.at(i);
        $ = _permission[token];
        whitelistUntil = $.whitelistUntil;

        if (block.timestamp < whitelistUntil && $.allowed[account]) {
          tokens[count] = token;
          whitelistUntils[count] = whitelistUntil;
          ++count;
        }
      }

      assembly {
        mstore(tokens, count)
        mstore(whitelistUntils, count)
      }
    }
  }

  /**
   * @inheritdoc IKatanaGovernance
   */
  function getManyTokensWhitelistInfo()
    external
    view
    returns (address[] memory tokens, uint40[] memory whitelistedUntils)
  {
    tokens = _tokens.values();
    uint256 length = tokens.length;
    whitelistedUntils = new uint40[](length);

    for (uint256 i; i < length; ++i) {
      whitelistedUntils[i] = _permission[tokens[i]].whitelistUntil;
    }
  }

  /**
   * @inheritdoc IKatanaV2Factory
   */
  function allowedAll() public view returns (bool) {
    return _v2Factory.allowedAll();
  }

  /**
   * @dev Sets the address of the factory contract.
   * Can only be called by the contract owner.
   */
  function _setFactory(address factory) private {
    _v2Factory = IKatanaV2Factory(factory);

    emit FactoryUpdated(_msgSender(), factory);
  }

  /**
   * @dev Sets the permission for a token.
   * @param token The address of the token.
   * @param whitelistUntil The end of the whitelist duration in seconds.
   * @param alloweds The array of addresses to be allowed in whitelist duration.
   * @param statuses The corresponding array of statuses (whether allowed or not).
   */
  function _setPermission(address token, uint40 whitelistUntil, address[] memory alloweds, bool[] memory statuses)
    private
  {
    uint256 length = alloweds.length;
    if (length != statuses.length) revert InvalidLength();

    Permission storage $ = _permission[token];
    $.whitelistUntil = whitelistUntil;
    _tokens.add(token);

    for (uint256 i; i < length; ++i) {
      $.allowed[alloweds[i]] = statuses[i];
    }

    emit PermissionUpdated(_msgSender(), token, whitelistUntil, alloweds, statuses);
  }

  /**
   * @dev Checks if an account is authorized.
   * @param account The address of the account to check authorization for.
   * @return A boolean indicating whether the account is authorized or not.
   */
  function _isAuthorized(Permission storage $, address account) private view returns (bool) {
    uint256 expiry = $.whitelistUntil;
    if (expiry == UNAUTHORIZED) return false;
    if (expiry == AUTHORIZED || block.timestamp > expiry) return true;

    return $.allowed[account];
  }

  /**
   * @dev Returns whether the account is skipped from authorization checks.
   */
  function _isSkipped(address account) internal view returns (bool) {
    return isAllowedActor[account] || allowedAll() || account == owner();
  }

  /**
   * @dev Sets the router address.
   */
  function _setRouter(address router) internal {
    emit RouterUpdated(_msgSender(), _router, router);
    _router = router;
  }

  /**
   * @dev Sets the actor as allowed or not.
   */
  function _setAllowedActor(address actor, bool allowed) internal {
    isAllowedActor[actor] = allowed;
    emit AllowedActorUpdated(actor, allowed);
  }
}
