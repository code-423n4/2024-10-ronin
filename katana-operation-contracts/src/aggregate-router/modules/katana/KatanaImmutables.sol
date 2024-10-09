// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;

struct KatanaParameters {
  address governance;
  address v2Factory;
  address v3Factory;
  bytes32 pairInitCodeHash;
  bytes32 poolInitCodeHash;
}

contract KatanaImmutables {
  /// @dev The address of KatanaGovernance
  address internal immutable KATANA_GOVERNANCE;

  /// @dev The address of KatanaV2Factory
  address internal immutable KATANA_V2_FACTORY;

  /// @dev The KatanaV2Pair initcodehash
  bytes32 internal immutable KATANA_V2_PAIR_INIT_CODE_HASH;

  /// @dev The address of KatanaV3Factory
  address internal immutable KATANA_V3_FACTORY;

  /// @dev The KatanaV3Pool initcodehash
  bytes32 internal immutable KATANA_V3_POOL_INIT_CODE_HASH;

  constructor(KatanaParameters memory params) {
    KATANA_GOVERNANCE = params.governance;
    KATANA_V2_FACTORY = params.v2Factory;
    KATANA_V2_PAIR_INIT_CODE_HASH = params.pairInitCodeHash;
    KATANA_V3_FACTORY = params.v3Factory;
    KATANA_V3_POOL_INIT_CODE_HASH = params.poolInitCodeHash;
  }
}
