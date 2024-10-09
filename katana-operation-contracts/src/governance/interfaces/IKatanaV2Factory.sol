// SPDX-License-Identifier: MIT
pragma solidity >=0.5.17 <0.9.0;

/**
 * @title IKatanaFactory
 *
 * @dev IKatanaFactory interface.
 * @notice Imported from https://github.com/axieinfinity/contract-infinity/blob/main/contracts/interfaces/IKatanaFactory.sol
 */
interface IKatanaV2Factory {
  /**
   * @dev Emitted when a pair for `token0` token and `token1` token is created.
   */
  event PairCreated(address indexed token0, address indexed token1, address pair, uint256 allPairsLength);

  /**
   * @dev Emitted when pair implement is changed from `old` to `new`.
   */
  event PairProxyUpdated(address indexed newImpl, address indexed oldImpl);

  function INIT_CODE_PAIR_HASH() external view returns (bytes32);

  /**
   * @dev Flag whether allowed all users to call.
   */
  function allowedAll() external view returns (bool);

  /**
   *
   * @dev Set allowed all.
   *
   * Requirements:
   *
   * - The method caller is admin.
   *
   */
  function setAllowedAll(bool) external;

  /**
   * @dev Returns implementation address for pair token.
   */
  function pairImplementation() external view returns (address);

  /**
   * @dev Set implementation address for all pairs.
   *
   * Requirements:
   *
   * - The method caller is admin.
   *
   * Emit a {PairProxyUpdated} event.
   */
  function setPairImplementation(address) external;

  /**
   * @dev Returns treasury address.
   */
  function treasury() external view returns (address);

  /**
   * @dev Sets treasury address.
   *
   * Requirements:
   *
   * - The method caller is admin.
   *
   */
  function setTreasury(address addr) external;

  /**
   * @dev Returns pair address for `tokenA` and `tokenB`.
   */
  function getPair(address tokenA, address tokenB) external view returns (address pair);

  /**
   * @dev Returns pair address at `index` position.
   */
  function allPairs(uint256 index) external view returns (address pair);

  /**
   * @dev Returns all pairs length.
   */
  function allPairsLength() external view returns (uint256);

  /**
   * @dev Create pair.
   *
   * Requirements:
   *
   * - The default method caller is contract admin.
   * - All addresses is allowed if `allowedAll` is true.
   *
   */
  function createPair(address tokenA, address tokenB) external returns (address pair);
}
