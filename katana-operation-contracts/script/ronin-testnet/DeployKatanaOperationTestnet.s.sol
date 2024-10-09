// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { RouterParameters } from "@katana/operation-contracts/aggregate-router/base/RouterImmutables.sol";
import { UpgradeKatanaGovernance } from "../UpgradeKatanaGovernance.s.sol";

contract DeployKatanaOperationTestnet is UpgradeKatanaGovernance {
  function setUp() public override {
    params = RouterParameters({
      permit2: 0xCcf4a457E775f317e0Cf306EFDda14Cc8084F82C,
      weth9: 0xA959726154953bAe111746E265E6d754F48570E6,
      governance: 0x247F12836A421CDC5e22B93Bf5A9AAa0f521f986,
      v2Factory: 0x86587380C4c815Ba0066c90aDB2B45CC9C15E72c,
      v3Factory: 0x4E7236ff45d69395DDEFE1445040A8f3C7CD8819,
      pairInitCodeHash: 0x1cc97ead4d6949b7a6ecb28652b21159b9fd5608ae51a1960224099caab07dca,
      poolInitCodeHash: 0xb381dabeb6037396a764deb39e57a4a3f75b641ce3e9944b1e4b18d036e322e1
    });

    proxyAdmin = 0x505d91E8fd2091794b45b27f86C045529fa92CD7;

    nonfungiblePositionManager = 0x7C2716803c09cd5eeD78Ba40117084af3c803565;
    v3Migrator = 0x8cF4743642acF849eff54873e24d46D0f3437593;
    legacyPermissionedRouter = 0x3BD36748D17e322cFB63417B059Bcc1059012D83;
    katanaGovernanceProxy = 0x247F12836A421CDC5e22B93Bf5A9AAa0f521f986;

    vm.rememberKey(vm.envUint("TESTNET_PK"));

    super.setUp();
  }
}
