// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { Script, console } from "forge-std/Script.sol";
import { RouterParameters } from "@katana/operation-contracts/aggregate-router/base/RouterImmutables.sol";
import { AggregateRouter } from "@katana/operation-contracts/aggregate-router/AggregateRouter.sol";

abstract contract DeployAggregateRouter is Script {
  RouterParameters public params;

  address public router;

  function setUp() public virtual {
    assert(params.permit2 != address(0));
    assert(params.weth9 != address(0));
    assert(params.v2Factory != address(0));
    assert(params.v3Factory != address(0));
    assert(params.pairInitCodeHash != bytes32(0));
    assert(params.poolInitCodeHash != bytes32(0));

    logParams();
  }

  function run() public virtual {
    vm.broadcast();
    router = address(new AggregateRouter(params));
    console.log("Aggregate Router deployed:", router);
  }

  function logParams() internal view virtual {
    console.log("permit2:", params.permit2);
    console.log("WRON:", params.weth9);
    console.log("v2Factory:", params.v2Factory);
    console.log("v3Factory:", params.v3Factory);
    console.log("pairInitCodeHash:", vm.toString(params.pairInitCodeHash));
    console.log("poolInitCodeHash:", vm.toString(params.poolInitCodeHash));
  }
}
