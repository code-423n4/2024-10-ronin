// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { Script, console } from "forge-std/Script.sol";
import { ITransparentUpgradeableProxy } from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import { KatanaGovernance } from "@katana/operation-contracts/governance/KatanaGovernance.sol";
import { DeployAggregateRouter } from "./DeployAggregateRouter.s.sol";

abstract contract UpgradeKatanaGovernance is DeployAggregateRouter {
  address public nonfungiblePositionManager;
  address public v3Migrator;
  address public legacyPermissionedRouter;
  address public katanaGovernanceProxy;
  address public proxyAdmin;

  address public katanaGovernanceLogic;

  function setUp() public virtual override {
    require(nonfungiblePositionManager != address(0));
    require(v3Migrator != address(0));
    require(legacyPermissionedRouter != address(0));
    require(katanaGovernanceProxy != address(0));
    require(proxyAdmin != address(0));

    super.setUp();
  }

  function run() public override {
    super.run();

    vm.broadcast();
    katanaGovernanceLogic = address(new KatanaGovernance());
    console.log("Katana Governance (logic) deployed:", katanaGovernanceLogic);

    console.log("Please upgrade to Katana Governance (logic) using ProxyAdmin", proxyAdmin);
    console.log(
      "Data:",
      vm.toString(
        abi.encodeCall(
          KatanaGovernance.initializeV2,
          (params.v3Factory, nonfungiblePositionManager, v3Migrator, legacyPermissionedRouter, router)
        )
      )
    );
  }

  function logParams() internal view override {
    console.log("nonfungiblePositionManager:", nonfungiblePositionManager);
    console.log("v3Migrator:", v3Migrator);
    console.log("legacyPermissionedRouter:", legacyPermissionedRouter);
    console.log("katanaGovernanceProxy:", katanaGovernanceProxy);
    console.log("proxyAdmin:", proxyAdmin);
  }
}
