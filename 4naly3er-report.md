# Report

- [Report](#report)
  - [Gas Optimizations](#gas-optimizations)
    - [\[GAS-1\] Don't use `_msgSender()` if not supporting EIP-2771](#gas-1-dont-use-_msgsender-if-not-supporting-eip-2771)
    - [\[GAS-2\] Using bools for storage incurs overhead](#gas-2-using-bools-for-storage-incurs-overhead)
    - [\[GAS-3\] Use calldata instead of memory for function arguments that do not get mutated](#gas-3-use-calldata-instead-of-memory-for-function-arguments-that-do-not-get-mutated)
    - [\[GAS-4\] For Operations that will not overflow, you could use unchecked](#gas-4-for-operations-that-will-not-overflow-you-could-use-unchecked)
    - [\[GAS-5\] Avoid contract existence checks by using low level calls](#gas-5-avoid-contract-existence-checks-by-using-low-level-calls)
    - [\[GAS-6\] State variables only set in the constructor should be declared `immutable`](#gas-6-state-variables-only-set-in-the-constructor-should-be-declared-immutable)
    - [\[GAS-7\] Functions guaranteed to revert when called by normal users can be marked `payable`](#gas-7-functions-guaranteed-to-revert-when-called-by-normal-users-can-be-marked-payable)
    - [\[GAS-8\] `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`)](#gas-8-i-costs-less-gas-compared-to-i-or-i--1-same-for---i-vs-i---or-i---1)
    - [\[GAS-9\] Increments/decrements can be unchecked in for-loops](#gas-9-incrementsdecrements-can-be-unchecked-in-for-loops)
    - [\[GAS-10\] Use != 0 instead of \> 0 for unsigned integer comparison](#gas-10-use--0-instead-of--0-for-unsigned-integer-comparison)
    - [\[GAS-11\] `internal` functions not called by the contract should be removed](#gas-11-internal-functions-not-called-by-the-contract-should-be-removed)
    - [\[GAS-12\] WETH address definition can be use directly](#gas-12-weth-address-definition-can-be-use-directly)
  - [Non Critical Issues](#non-critical-issues)
    - [\[NC-1\] Missing checks for `address(0)` when assigning values to address state variables](#nc-1-missing-checks-for-address0-when-assigning-values-to-address-state-variables)
    - [\[NC-2\] Array indices should be referenced via `enum`s rather than via numeric literals](#nc-2-array-indices-should-be-referenced-via-enums-rather-than-via-numeric-literals)
    - [\[NC-3\] Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked`](#nc-3-use-stringconcat-or-bytesconcat-instead-of-abiencodepacked)
    - [\[NC-4\] `constant`s should be defined rather than using magic numbers](#nc-4-constants-should-be-defined-rather-than-using-magic-numbers)
    - [\[NC-5\] Control structures do not follow the Solidity Style Guide](#nc-5-control-structures-do-not-follow-the-solidity-style-guide)
    - [\[NC-6\] Dangerous `while(true)` loop](#nc-6-dangerous-whiletrue-loop)
    - [\[NC-7\] Default Visibility for constants](#nc-7-default-visibility-for-constants)
    - [\[NC-8\] Consider disabling `renounceOwnership()`](#nc-8-consider-disabling-renounceownership)
    - [\[NC-9\] Function ordering does not follow the Solidity style guide](#nc-9-function-ordering-does-not-follow-the-solidity-style-guide)
    - [\[NC-10\] Functions should not be longer than 50 lines](#nc-10-functions-should-not-be-longer-than-50-lines)
    - [\[NC-11\] Lack of checks in setters](#nc-11-lack-of-checks-in-setters)
    - [\[NC-12\] Missing Event for critical parameters change](#nc-12-missing-event-for-critical-parameters-change)
    - [\[NC-13\] NatSpec is completely non-existent on functions that should have them](#nc-13-natspec-is-completely-non-existent-on-functions-that-should-have-them)
    - [\[NC-14\] Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor](#nc-14-use-a-modifier-instead-of-a-requireif-statement-for-a-special-msgsender-actor)
    - [\[NC-15\] Adding a `return` statement when the function defines a named return variable, is redundant](#nc-15-adding-a-return-statement-when-the-function-defines-a-named-return-variable-is-redundant)
    - [\[NC-16\] Take advantage of Custom Error's return value property](#nc-16-take-advantage-of-custom-errors-return-value-property)
    - [\[NC-17\] Avoid the use of sensitive terms](#nc-17-avoid-the-use-of-sensitive-terms)
    - [\[NC-18\] Contract does not follow the Solidity style guide's suggested layout ordering](#nc-18-contract-does-not-follow-the-solidity-style-guides-suggested-layout-ordering)
    - [\[NC-19\] Use Underscores for Number Literals (add an underscore every 3 digits)](#nc-19-use-underscores-for-number-literals-add-an-underscore-every-3-digits)
    - [\[NC-20\] Internal and private variables and functions names should begin with an underscore](#nc-20-internal-and-private-variables-and-functions-names-should-begin-with-an-underscore)
    - [\[NC-21\] Event is missing `indexed` fields](#nc-21-event-is-missing-indexed-fields)
    - [\[NC-22\] Variables need not be initialized to zero](#nc-22-variables-need-not-be-initialized-to-zero)
  - [Low Issues](#low-issues)
    - [\[L-1\] Use a 2-step ownership transfer pattern](#l-1-use-a-2-step-ownership-transfer-pattern)
    - [\[L-2\] Some tokens may revert when zero value transfers are made](#l-2-some-tokens-may-revert-when-zero-value-transfers-are-made)
    - [\[L-3\] Missing checks for `address(0)` when assigning values to address state variables](#l-3-missing-checks-for-address0-when-assigning-values-to-address-state-variables)
    - [\[L-4\] `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()`](#l-4-abiencodepacked-should-not-be-used-with-dynamic-types-when-passing-the-result-to-a-hash-function-such-as-keccak256)
    - [\[L-5\] Division by zero not prevented](#l-5-division-by-zero-not-prevented)
    - [\[L-6\] Duplicate import statements](#l-6-duplicate-import-statements)
    - [\[L-7\] Empty `receive()/payable fallback()` function does not authenticate requests](#l-7-empty-receivepayable-fallback-function-does-not-authenticate-requests)
    - [\[L-8\] Initializers could be front-run](#l-8-initializers-could-be-front-run)
    - [\[L-9\] Loss of precision](#l-9-loss-of-precision)
    - [\[L-10\] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`](#l-10-solidity-version-0820-may-not-work-on-other-chains-due-to-push0)
    - [\[L-11\] Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership`](#l-11-use-ownable2steptransferownership-instead-of-ownabletransferownership)
    - [\[L-12\] Sweeping may break accounting if tokens with multiple addresses are used](#l-12-sweeping-may-break-accounting-if-tokens-with-multiple-addresses-are-used)
    - [\[L-13\] Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting](#l-13-consider-using-openzeppelins-safecast-library-to-prevent-unexpected-overflows-when-downcasting)
    - [\[L-14\] Unsafe ERC20 operation(s)](#l-14-unsafe-erc20-operations)
    - [\[L-15\] Unspecific compiler version pragma](#l-15-unspecific-compiler-version-pragma)
    - [\[L-16\] Upgradeable contract is missing a `__gap[50]` storage variable to allow for new storage variables in later versions](#l-16-upgradeable-contract-is-missing-a-__gap50-storage-variable-to-allow-for-new-storage-variables-in-later-versions)
    - [\[L-17\] Upgradeable contract not initialized](#l-17-upgradeable-contract-not-initialized)
  - [Medium Issues](#medium-issues)
    - [\[M-1\] Centralization Risk for trusted owners](#m-1-centralization-risk-for-trusted-owners)
      - [Impact](#impact)
    - [\[M-2\] Fees can be set to be greater than 100%](#m-2-fees-can-be-set-to-be-greater-than-100)
    - [\[M-3\]  Solmate's SafeTransferLib does not check for token contract's existence](#m-3--solmates-safetransferlib-does-not-check-for-token-contracts-existence)

## Gas Optimizations

| |Issue|Instances|
|-|:-|:-:|
| [GAS-1](#GAS-1) | Don't use `_msgSender()` if not supporting EIP-2771 | 4 |
| [GAS-2](#GAS-2) | Using bools for storage incurs overhead | 1 |
| [GAS-3](#GAS-3) | Use calldata instead of memory for function arguments that do not get mutated | 1 |
| [GAS-4](#GAS-4) | For Operations that will not overflow, you could use unchecked | 79 |
| [GAS-5](#GAS-5) | Avoid contract existence checks by using low level calls | 9 |
| [GAS-6](#GAS-6) | State variables only set in the constructor should be declared `immutable` | 7 |
| [GAS-7](#GAS-7) | Functions guaranteed to revert when called by normal users can be marked `payable` | 6 |
| [GAS-8](#GAS-8) | `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`) | 2 |
| [GAS-9](#GAS-9) | Increments/decrements can be unchecked in for-loops | 7 |
| [GAS-10](#GAS-10) | Use != 0 instead of > 0 for unsigned integer comparison | 6 |
| [GAS-11](#GAS-11) | `internal` functions not called by the contract should be removed | 6 |
| [GAS-12](#GAS-12) | WETH address definition can be use directly | 3 |

### <a name="GAS-1"></a>[GAS-1] Don't use `_msgSender()` if not supporting EIP-2771

Use `msg.sender` if the code does not implement [EIP-2771 trusted forwarder](https://eips.ethereum.org/EIPS/eip-2771) support

*Instances (4)*:

```solidity
File: src/governance/KatanaGovernance.sol

120:     address sender = _msgSender();

343:     emit FactoryUpdated(_msgSender(), factory);

367:     emit PermissionUpdated(_msgSender(), token, whitelistUntil, alloweds, statuses);

394:     emit RouterUpdated(_msgSender(), _router, router);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="GAS-2"></a>[GAS-2] Using bools for storage incurs overhead

Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (1)*:

```solidity
File: src/governance/KatanaGovernance.sol

37:   mapping(address actor => bool) public isAllowedActor;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="GAS-3"></a>[GAS-3] Use calldata instead of memory for function arguments that do not get mutated

When a function with a `memory` array is called externally, the `abi.decode()` step has to use a for-loop to copy each index of the `calldata` to the `memory` index. Each iteration of this for-loop costs at least 60 gas (i.e. `60 * <mem_array>.length`). Using `calldata` directly bypasses this loop.

If the array is passed to an `internal` function which passes the array to another internal function where the array is modified and therefore `memory` is used in the `external` call, it's still more gas-efficient to use `calldata` when the `external` function uses modifiers, since the modifiers may prevent the internal functions from being called. Structs have the same overhead as an array of length one.

 *Saves 60 gas per instance*

*Instances (1)*:

```solidity
File: src/governance/KatanaGovernance.sol

258:   function isAuthorized(address[] memory tokens, address account) public view returns (bool authorized) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="GAS-4"></a>[GAS-4] For Operations that will not overflow, you could use unchecked

*Instances (79)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

5: import { Dispatcher } from "./base/Dispatcher.sol";

6: import { RouterParameters } from "./base/RouterImmutables.sol";

7: import { PaymentsImmutables, PaymentsParameters } from "./modules/PaymentsImmutables.sol";

8: import { KatanaImmutables, KatanaParameters } from "./modules/katana/KatanaImmutables.sol";

9: import { Commands } from "./libraries/Commands.sol";

10: import { IAggregateRouter } from "./interfaces/IAggregateRouter.sol";

56:         commandIndex++;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/base/Dispatcher.sol

4: import { V2SwapRouter } from "../modules/katana/v2/V2SwapRouter.sol";

5: import { V3SwapRouter } from "../modules/katana/v3/V3SwapRouter.sol";

6: import { BytesLib } from "../modules/katana/v3/BytesLib.sol";

7: import { Payments } from "../modules/Payments.sol";

8: import { PaymentsImmutables } from "../modules/PaymentsImmutables.sol";

9: import { Commands } from "../libraries/Commands.sol";

10: import { LockAndMsgSender } from "./LockAndMsgSender.sol";

11: import { ERC20 } from "solmate/tokens/ERC20.sol";

12: import { IAllowanceTransfer } from "permit2/src/interfaces/IAllowanceTransfer.sol";

51:         checkAuthorizedV3Path(path); // place the check here to avoid stack too deep error

162:         bytes calldata data = inputs.toBytes(6); // PermitSingle takes first 6 slots (0..5)

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

4: import { Constants } from "../libraries/Constants.sol";

5: import { PaymentsImmutables } from "../modules/PaymentsImmutables.sol";

6: import { SafeTransferLib } from "solmate/utils/SafeTransferLib.sol";

7: import { ERC20 } from "solmate/tokens/ERC20.sol";

46:       uint256 amount = (balance * bips) / FEE_BIPS_BASE;

50:       uint256 amount = (balance * bips) / FEE_BIPS_BASE;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/PaymentsImmutables.sol

4: import { IWETH9 } from "../interfaces/external/IWETH9.sol";

5: import { IAllowanceTransfer } from "permit2/src/interfaces/IAllowanceTransfer.sol";

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/PaymentsImmutables.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

4: import { IKatanaV2Pair } from "@katana/v3-contracts/periphery/interfaces/IKatanaV2Pair.sol";

5: import { IKatanaGovernance } from "@katana/v3-contracts/external/interfaces/IKatanaGovernance.sol";

6: import { KatanaV2Library } from "./KatanaV2Library.sol";

7: import { KatanaImmutables } from "../KatanaImmutables.sol";

8: import { Payments } from "../../Payments.sol";

9: import { Permit2Payments } from "../../Permit2Payments.sol";

10: import { Constants } from "../../../libraries/Constants.sol";

11: import { ERC20 } from "solmate/tokens/ERC20.sol";

28:       uint256 finalPairIndex = path.length - 1;

29:       uint256 penultimatePairIndex = finalPairIndex - 1;

30:       for (uint256 i; i < finalPairIndex; i++) {

31:         (address input, address output) = (path[i], path[i + 1]);

34:         uint256 amountInput = ERC20(input).balanceOf(pair) - reserveInput;

40:           ? KatanaV2Library.pairAndToken0For(KATANA_V2_FACTORY, KATANA_V2_PAIR_INIT_CODE_HASH, output, path[i + 2])

63:       amountIn != Constants.ALREADY_PAID // amountIn of 0 to signal that the pair already has the tokens

68:     ERC20 tokenOut = ERC20(path[path.length - 1]);

73:     uint256 amountOut = tokenOut.balanceOf(recipient) - balanceBefore;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

4: import { V3Path } from "./V3Path.sol";

5: import { BytesLib } from "./BytesLib.sol";

6: import { IKatanaGovernance } from "@katana/v3-contracts/external/interfaces/IKatanaGovernance.sol";

7: import { SafeCast } from "@katana/v3-contracts/core/libraries/SafeCast.sol";

8: import { IKatanaV3Pool } from "@katana/v3-contracts/core/interfaces/IKatanaV3Pool.sol";

9: import { IKatanaV3SwapCallback } from "@katana/v3-contracts/core/interfaces/callback/IKatanaV3SwapCallback.sol";

10: import { Constants } from "../../../libraries/Constants.sol";

11: import { Permit2Payments } from "../../Permit2Payments.sol";

12: import { KatanaImmutables } from "../KatanaImmutables.sol";

13: import { Constants } from "../../../libraries/Constants.sol";

14: import { ERC20 } from "solmate/tokens/ERC20.sol";

43:     if (amount0Delta <= 0 && amount1Delta <= 0) revert V3InvalidSwap(); // swaps entirely within 0-liquidity regions are not supported

63:         _swap(-amountToPay.toInt256(), msg.sender, path, payer, false);

98:         hasMultiplePools ? address(this) : recipient, // for intermediate swaps, this contract custodies

99:         path.getFirstPool(), // only the first pool is needed

100:         payer, // for intermediate swaps, this contract custodies

104:       amountIn = uint256(-(zeroForOne ? amount1Delta : amount0Delta));

134:       _swap(-amountOut.toInt256(), recipient, path, payer, false);

136:     uint256 amountOutReceived = zeroForOne ? uint256(-amount1Delta) : uint256(-amount0Delta);

144:     uint256 length = path.length / Constants.NEXT_V3_POOL_OFFSET + 1;

146:     for (uint256 i; i < length; ++i) {

148:       if (i + 1 < length) path = path.skipToken();

164:       recipient, zeroForOne, amount, (zeroForOne ? MIN_SQRT_RATIO + 1 : MAX_SQRT_RATIO - 1), abi.encode(path, payer)

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

4: import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

5: import { EnumerableSet } from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

6: import { Address } from "@openzeppelin/contracts/utils/Address.sol";

7: import { IKatanaV3Factory } from "@katana/v3-contracts/core/interfaces/IKatanaV3Factory.sol";

8: import { IKatanaV2Factory } from "./interfaces/IKatanaV2Factory.sol";

9: import { IKatanaV2Pair } from "@katana/v3-contracts/periphery/interfaces/IKatanaV2Pair.sol";

10: import { IKatanaGovernance } from "@katana/v3-contracts/external/interfaces/IKatanaGovernance.sol";

61:     for (uint256 i; i < length; ++i) {

262:     for (uint256 i; i < length; ++i) {

293:       for (uint256 i; i < length; ++i) {

301:           ++count;

324:     for (uint256 i; i < length; ++i) {

363:     for (uint256 i; i < length; ++i) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="GAS-5"></a>[GAS-5] Avoid contract existence checks by using low level calls

Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low level calls never check for contract existence

*Instances (9)*:

```solidity
File: src/aggregate-router/base/Dispatcher.sol

196:         success = (ERC20(token).balanceOf(owner) >= minBalance);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

31:         value = ERC20(token).balanceOf(address(this));

49:       uint256 balance = ERC20(token).balanceOf(address(this));

66:       balance = ERC20(token).balanceOf(address(this));

93:     uint256 value = WETH9.balanceOf(address(this));

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

34:         uint256 amountInput = ERC20(input).balanceOf(pair) - reserveInput;

69:     uint256 balanceBefore = tokenOut.balanceOf(recipient);

73:     uint256 amountOut = tokenOut.balanceOf(recipient) - balanceBefore;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

88:       amountIn = ERC20(tokenIn).balanceOf(address(this));

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="GAS-6"></a>[GAS-6] State variables only set in the constructor should be declared `immutable`

Variables only set in the constructor and never edited afterwards should be marked as immutable, as it would avoid the expensive storage-writing operation in the constructor (around **20 000 gas** per variable) and replace the expensive storage-reading operations (around **2100 gas** per reading) to a less expensive value reading (**3 gas**)

*Instances (7)*:

```solidity
File: src/aggregate-router/modules/PaymentsImmutables.sol

20:     WETH9 = IWETH9(params.weth9);

21:     PERMIT2 = IAllowanceTransfer(params.permit2);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/PaymentsImmutables.sol)

```solidity
File: src/aggregate-router/modules/katana/KatanaImmutables.sol

29:     KATANA_GOVERNANCE = params.governance;

30:     KATANA_V2_FACTORY = params.v2Factory;

31:     KATANA_V2_PAIR_INIT_CODE_HASH = params.pairInitCodeHash;

32:     KATANA_V3_FACTORY = params.v3Factory;

33:     KATANA_V3_POOL_INIT_CODE_HASH = params.poolInitCodeHash;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/KatanaImmutables.sol)

### <a name="GAS-7"></a>[GAS-7] Functions guaranteed to revert when called by normal users can be marked `payable`

If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided.

*Instances (6)*:

```solidity
File: src/governance/KatanaGovernance.sol

88:   function setRouter(address router) external onlyOwner {

95:   function setAllowedActor(address actor, bool allowed) external onlyOwner {

102:   function toggleFlashLoanPermission() external onlyOwner {

157:   function setPairImplementation(address impl) external onlyOwner {

164:   function setAllowedAll(bool shouldAllow) external onlyOwner {

171:   function setTreasury(address newTreasury) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="GAS-8"></a>[GAS-8] `++i` costs less gas compared to `i++` or `i += 1` (same for `--i` vs `i--` or `i -= 1`)

Pre-increments and pre-decrements are cheaper.

For a `uint256 i` variable, the following is true with the Optimizer enabled at 10k:

**Increment:**

- `i += 1` is the most expensive form
- `i++` costs 6 gas less than `i += 1`
- `++i` costs 5 gas less than `i++` (11 gas less than `i += 1`)

**Decrement:**

- `i -= 1` is the most expensive form
- `i--` costs 11 gas less than `i -= 1`
- `--i` costs 5 gas less than `i--` (16 gas less than `i -= 1`)

Note that post-increments (or post-decrements) return the old value before incrementing or decrementing, hence the name *post-increment*:

```solidity
uint i = 1;  
uint j = 2;
require(j == i++, "This will be false as i is incremented after the comparison");
```
  
However, pre-increments (or pre-decrements) return the new value:
  
```solidity
uint i = 1;  
uint j = 2;
require(j == ++i, "This will be true as i is incremented before the comparison");
```

In the pre-increment case, the compiler has to create a temporary variable (when used) for returning `1` instead of `2`.

Consider using pre-increments and pre-decrements where they are relevant (meaning: not where post-increments/decrements logic are relevant).

*Saves 5 gas per instance*

*Instances (2)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

56:         commandIndex++;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

30:       for (uint256 i; i < finalPairIndex; i++) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

### <a name="GAS-9"></a>[GAS-9] Increments/decrements can be unchecked in for-loops

In Solidity 0.8+, there's a default overflow check on unsigned integers. It's possible to uncheck this in for-loops and save some gas at each iteration, but at the cost of some code readability, as this uncheck cannot be made inline.

[ethereum/solidity#10695](https://github.com/ethereum/solidity/issues/10695)

The change would be:

```diff
- for (uint256 i; i < numIterations; i++) {
+ for (uint256 i; i < numIterations;) {
 // ...  
+   unchecked { ++i; }
}  
```

These save around **25 gas saved** per instance.

The same can be applied with decrements (which should use `break` when `i == 0`).

The risk of overflow is non-existent for `uint256`.

*Instances (7)*:

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

30:       for (uint256 i; i < finalPairIndex; i++) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

146:     for (uint256 i; i < length; ++i) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

61:     for (uint256 i; i < length; ++i) {

262:     for (uint256 i; i < length; ++i) {

293:       for (uint256 i; i < length; ++i) {

324:     for (uint256 i; i < length; ++i) {

363:     for (uint256 i; i < length; ++i) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="GAS-10"></a>[GAS-10] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (6)*:

```solidity
File: src/aggregate-router/modules/Payments.sol

64:       if (balance > 0) recipient.safeTransferETH(balance);

68:       if (balance > 0) ERC20(token).safeTransfer(recipient, balance);

81:     if (amount > 0) {

97:     if (value > 0) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

53:       amount0Delta > 0 ? (tokenIn < tokenOut, uint256(amount0Delta)) : (tokenOut < tokenIn, uint256(amount1Delta));

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/interfaces/IKatanaV2Factory.sol

2: pragma solidity >=0.5.17 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/interfaces/IKatanaV2Factory.sol)

### <a name="GAS-11"></a>[GAS-11] `internal` functions not called by the contract should be removed

If the functions are required by an interface, the contract should inherit from that interface and use the `override` keyword

*Instances (6)*:

```solidity
File: src/aggregate-router/base/Dispatcher.sol

215:   function getValueAndData(bytes calldata inputs) internal pure returns (uint256 value, bytes calldata data) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

26:   function pay(address token, address recipient, uint256 value) internal {

42:   function payPortion(address token, address recipient, uint256 bips) internal {

59:   function sweep(address token, address recipient, uint256 amountMinimum) internal {

75:   function wrapETH(address recipient, uint256 amount) internal {

92:   function unwrapWETH9(address recipient, uint256 amountMinimum) internal {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

### <a name="GAS-12"></a>[GAS-12] WETH address definition can be use directly

WETH is a wrap Ether contract with a specific address in the Ethereum network, giving the option to define it may cause false recognition, it is healthier to define it directly.

    Advantages of defining a specific contract directly:
    
    It saves gas,
    Prevents incorrect argument definition,
    Prevents execution on a different chain and re-signature issues,
    WETH Address : 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2

*Instances (3)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

24:     PaymentsImmutables(PaymentsParameters(params.permit2, params.weth9))

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/libraries/Commands.sol

32:   uint256 constant UNWRAP_WETH = 0x0c;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/libraries/Commands.sol)

```solidity
File: src/aggregate-router/modules/PaymentsImmutables.sol

14:   IWETH9 internal immutable WETH9;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/PaymentsImmutables.sol)

## Non Critical Issues

| |Issue|Instances|
|-|:-|:-:|
| [NC-1](#NC-1) | Missing checks for `address(0)` when assigning values to address state variables | 2 |
| [NC-2](#NC-2) | Array indices should be referenced via `enum`s rather than via numeric literals | 6 |
| [NC-3](#NC-3) | Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked` | 2 |
| [NC-4](#NC-4) | `constant`s should be defined rather than using magic numbers | 2 |
| [NC-5](#NC-5) | Control structures do not follow the Solidity Style Guide | 29 |
| [NC-6](#NC-6) | Dangerous `while(true)` loop | 1 |
| [NC-7](#NC-7) | Default Visibility for constants | 15 |
| [NC-8](#NC-8) | Consider disabling `renounceOwnership()` | 1 |
| [NC-9](#NC-9) | Function ordering does not follow the Solidity style guide | 3 |
| [NC-10](#NC-10) | Functions should not be longer than 50 lines | 52 |
| [NC-11](#NC-11) | Lack of checks in setters | 9 |
| [NC-12](#NC-12) | Missing Event for critical parameters change | 6 |
| [NC-13](#NC-13) | NatSpec is completely non-existent on functions that should have them | 3 |
| [NC-14](#NC-14) | Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor | 3 |
| [NC-15](#NC-15) | Adding a `return` statement when the function defines a named return variable, is redundant | 6 |
| [NC-16](#NC-16) | Take advantage of Custom Error's return value property | 19 |
| [NC-17](#NC-17) | Avoid the use of sensitive terms | 23 |
| [NC-18](#NC-18) | Contract does not follow the Solidity style guide's suggested layout ordering | 3 |
| [NC-19](#NC-19) | Use Underscores for Number Literals (add an underscore every 3 digits) | 2 |
| [NC-20](#NC-20) | Internal and private variables and functions names should begin with an underscore | 15 |
| [NC-21](#NC-21) | Event is missing `indexed` fields | 1 |
| [NC-22](#NC-22) | Variables need not be initialized to zero | 1 |

### <a name="NC-1"></a>[NC-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (2)*:

```solidity
File: src/governance/KatanaGovernance.sol

76:     _positionManager = positionManager;

395:     _router = router;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-2"></a>[NC-2] Array indices should be referenced via `enum`s rather than via numeric literals

*Instances (6)*:

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

27:       (address token0,) = KatanaV2Library.sortTokens(path[0], path[1]);

61:     address firstPair = KatanaV2Library.pairFor(KATANA_V2_FACTORY, KATANA_V2_PAIR_INIT_CODE_HASH, path[0], path[1]);

65:       payOrPermit2Transfer(path[0], payer, firstPair, amountIn);

94:     payOrPermit2Transfer(path[0], payer, firstPair, amountIn);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

122:     tokens[0] = tokenA;

123:     tokens[1] = tokenB;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-3"></a>[NC-3] Use `string.concat()` or `bytes.concat()` instead of `abi.encodePacked`

Solidity version 0.8.4 introduces `bytes.concat()` (vs `abi.encodePacked(<bytes>,<bytes>)`)

Solidity version 0.8.12 introduces `string.concat()` (vs `abi.encodePacked(<str>,<str>), which catches concatenation errors (in the event of a`bytes`data mixed in the concatenation)`)

*Instances (2)*:

```solidity
File: src/aggregate-router/base/Dispatcher.sol

197:         if (!success) output = abi.encodePacked(BalanceTooLow.selector);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

174:             abi.encodePacked(

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="NC-4"></a>[NC-4] `constant`s should be defined rather than using magic numbers

Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*Instances (2)*:

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

24:       if (path.length < 2) revert V2InvalidPath();

40:           ? KatanaV2Library.pairAndToken0For(KATANA_V2_FACTORY, KATANA_V2_PAIR_INIT_CODE_HASH, output, path[i + 2])

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

### <a name="NC-5"></a>[NC-5] Control structures do not follow the Solidity Style Guide

See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*Instances (29)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

14:     if (block.timestamp > deadline) revert TransactionDeadlinePassed();

41:     if (inputs.length != numCommands) revert LengthMismatch();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/base/Dispatcher.sol

197:         if (!success) output = abi.encodePacked(BalanceTooLow.selector);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/libraries/Commands.sol

25:   uint256 constant FIRST_IF_BOUNDARY = 0x08;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/libraries/Commands.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

43:     if (bips == 0 || bips > FEE_BIPS_BASE) revert InvalidBips();

63:       if (balance < amountMinimum) revert InsufficientETH();

64:       if (balance > 0) recipient.safeTransferETH(balance);

67:       if (balance < amountMinimum) revert InsufficientToken();

68:       if (balance > 0) ERC20(token).safeTransfer(recipient, balance);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

21:     if (!IKatanaGovernance(KATANA_GOVERNANCE).isAuthorized(path, msg.sender)) revert V2UnauthorizedPath();

24:       if (path.length < 2) revert V2InvalidPath();

62:     if (

74:     if (amountOut < amountOutMinimum) revert V2TooLittleReceived();

92:     if (amountIn > amountInMaximum) revert V2TooMuchRequested();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

43:     if (amount0Delta <= 0 && amount1Delta <= 0) revert V3InvalidSwap(); // swaps entirely within 0-liquidity regions are not supported

50:     if (computePoolAddress(tokenIn, tokenOut, fee) != msg.sender) revert V3InvalidCaller();

65:         if (amountToPay > maxAmountInCached) revert V3TooMuchRequested();

116:     if (amountOut < amountOutMinimum) revert V3TooLittleReceived();

138:     if (amountOutReceived != amountOut) revert V3InvalidAmountOut();

148:       if (i + 1 < length) path = path.skipToken();

150:     if (!IKatanaGovernance(KATANA_GOVERNANCE).isAuthorized(tokens, msg.sender)) revert V3UnauthorizedSwap();

169:     if (tokenA > tokenB) (tokenA, tokenB) = (tokenB, tokenA);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

124:     if (!isAuthorized(tokens, sender)) revert Unauthorized();

250:     if (_isSkipped(account)) return true;

259:     if (_isSkipped(account)) return true;

263:       if (!_isAuthorized(_permission[tokens[i]], account)) return false;

357:     if (length != statuses.length) revert InvalidLength();

377:     if (expiry == UNAUTHORIZED) return false;

378:     if (expiry == AUTHORIZED || block.timestamp > expiry) return true;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-6"></a>[NC-6] Dangerous `while(true)` loop

Consider using for-loops to avoid all risks of an infinite-loop situation

*Instances (1)*:

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

92:     while (true) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="NC-7"></a>[NC-7] Default Visibility for constants

Some constants are using the default visibility. For readability, consider explicitly declaring them as `internal`.

*Instances (15)*:

```solidity
File: src/aggregate-router/libraries/Commands.sol

14:   uint256 constant V3_SWAP_EXACT_IN = 0x00;

15:   uint256 constant V3_SWAP_EXACT_OUT = 0x01;

16:   uint256 constant PERMIT2_TRANSFER_FROM = 0x02;

17:   uint256 constant PERMIT2_PERMIT_BATCH = 0x03;

18:   uint256 constant SWEEP = 0x04;

19:   uint256 constant TRANSFER = 0x05;

20:   uint256 constant PAY_PORTION = 0x06;

25:   uint256 constant FIRST_IF_BOUNDARY = 0x08;

28:   uint256 constant V2_SWAP_EXACT_IN = 0x08;

29:   uint256 constant V2_SWAP_EXACT_OUT = 0x09;

30:   uint256 constant PERMIT2_PERMIT = 0x0a;

31:   uint256 constant WRAP_ETH = 0x0b;

32:   uint256 constant UNWRAP_WETH = 0x0c;

33:   uint256 constant PERMIT2_TRANSFER_FROM_BATCH = 0x0d;

34:   uint256 constant BALANCE_CHECK_ERC20 = 0x0e;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/libraries/Commands.sol)

### <a name="NC-8"></a>[NC-8] Consider disabling `renounceOwnership()`

If the plan for your project does not include eventually giving up all ownership control, consider overwriting OpenZeppelin's `Ownable`'s `renounceOwnership()` function in order to disable it.

*Instances (1)*:

```solidity
File: src/governance/KatanaGovernance.sol

12: contract KatanaGovernance is OwnableUpgradeable, IKatanaV2Factory, IKatanaGovernance {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-9"></a>[NC-9] Function ordering does not follow the Solidity style guide

According to the [Solidity style guide](https://docs.soliditylang.org/en/v0.8.17/style-guide.html#order-of-functions), functions should be laid out in the following order :`constructor()`, `receive()`, `fallback()`, `external`, `public`, `internal`, `private`, but the cases below do not follow this pattern

*Instances (3)*:

```solidity
File: src/aggregate-router/base/Dispatcher.sol

1: 
   Current order:
   internal dispatch
   external execute
   internal getValueAndData
   
   Suggested order:
   external execute
   internal dispatch
   internal getValueAndData

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

1: 
   Current order:
   private _v2Swap
   internal v2SwapExactInput
   internal v2SwapExactOutput
   
   Suggested order:
   internal v2SwapExactInput
   internal v2SwapExactOutput
   private _v2Swap

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

1: 
   Current order:
   external initialize
   external initializeV2
   external setRouter
   external setAllowedActor
   external toggleFlashLoanPermission
   external enableFeeAmount
   external createPair
   external createPairAndSetPermission
   external setPermission
   external setPairImplementation
   external setAllowedAll
   external setTreasury
   external getPair
   external allPairs
   external allPairsLength
   external treasury
   external pairImplementation
   external INIT_CODE_PAIR_HASH
   external getRouter
   external getV2Factory
   external getV3Factory
   external getPositionManager
   public isAuthorized
   public isAuthorized
   external getWhitelistUntil
   external getWhitelistedTokensFor
   external getManyTokensWhitelistInfo
   public allowedAll
   private _setFactory
   private _setPermission
   private _isAuthorized
   internal _isSkipped
   internal _setRouter
   internal _setAllowedActor
   
   Suggested order:
   external initialize
   external initializeV2
   external setRouter
   external setAllowedActor
   external toggleFlashLoanPermission
   external enableFeeAmount
   external createPair
   external createPairAndSetPermission
   external setPermission
   external setPairImplementation
   external setAllowedAll
   external setTreasury
   external getPair
   external allPairs
   external allPairsLength
   external treasury
   external pairImplementation
   external INIT_CODE_PAIR_HASH
   external getRouter
   external getV2Factory
   external getV3Factory
   external getPositionManager
   external getWhitelistUntil
   external getWhitelistedTokensFor
   external getManyTokensWhitelistInfo
   public isAuthorized
   public isAuthorized
   public allowedAll
   internal _isSkipped
   internal _setRouter
   internal _setAllowedActor
   private _setFactory
   private _setPermission
   private _isAuthorized

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-10"></a>[NC-10] Functions should not be longer than 50 lines

Overly complex code can make understanding functionality more difficult, try to further modularize your code to ensure readability

*Instances (52)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

28:   function execute(bytes calldata commands, bytes[] calldata inputs, uint256 deadline)

37:   function execute(bytes calldata commands, bytes[] calldata inputs) public payable override isNotLocked {

61:   function successRequired(bytes1 command) internal pure returns (bool) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/base/Dispatcher.sol

28:   function dispatch(bytes1 commandType, bytes calldata inputs) internal returns (bool success, bytes memory output) {

208:   function execute(bytes calldata commands, bytes[] calldata inputs) external payable virtual;

215:   function getValueAndData(bytes calldata inputs) internal pure returns (uint256 value, bytes calldata data) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

26:   function pay(address token, address recipient, uint256 value) internal {

42:   function payPortion(address token, address recipient, uint256 bips) internal {

59:   function sweep(address token, address recipient, uint256 amountMinimum) internal {

75:   function wrapETH(address recipient, uint256 amount) internal {

92:   function unwrapWETH9(address recipient, uint256 amountMinimum) internal {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

20:   function _v2Swap(address[] calldata path, address recipient, address pair) private {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

42:   function katanaV3SwapCallback(int256 amount0Delta, int256 amount1Delta, bytes calldata data) external {

143:   function checkAuthorizedV3Path(bytes calldata path) internal view {

155:   function _swap(int256 amount, address recipient, bytes calldata path, address payer, bool isExactIn)

168:   function computePoolAddress(address tokenA, address tokenB, uint24 fee) private view returns (address pool) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

51:   function initialize(address admin, address factory) external initializer {

88:   function setRouter(address router) external onlyOwner {

95:   function setAllowedActor(address actor, bool allowed) external onlyOwner {

102:   function toggleFlashLoanPermission() external onlyOwner {

109:   function enableFeeAmount(uint24 fee, int24 tickSpacing, uint8 feeProtocolNum, uint8 feeProtocolDen)

119:   function createPair(address tokenA, address tokenB) external returns (address pair) {

147:   function setPermission(address token, uint40 whitelistUntil, address[] calldata alloweds, bool[] calldata statuses)

157:   function setPairImplementation(address impl) external onlyOwner {

164:   function setAllowedAll(bool shouldAllow) external onlyOwner {

171:   function setTreasury(address newTreasury) external onlyOwner {

179:   function getPair(address tokenA, address tokenB) external view returns (address pair) {

186:   function allPairs(uint256 index) external view returns (address pair) {

193:   function allPairsLength() external view returns (uint256) {

200:   function treasury() external view returns (address) {

207:   function pairImplementation() external view returns (address) {

214:   function INIT_CODE_PAIR_HASH() external view returns (bytes32) {

221:   function getRouter() external view returns (address) {

228:   function getV2Factory() external view returns (address) {

235:   function getV3Factory() external view override returns (address) {

242:   function getPositionManager() external view override returns (address) {

249:   function isAuthorized(address token, address account) public view returns (bool authorized) {

258:   function isAuthorized(address[] memory tokens, address account) public view returns (bool authorized) {

272:   function getWhitelistUntil(address token) external view returns (uint40) {

332:   function allowedAll() public view returns (bool) {

353:   function _setPermission(address token, uint40 whitelistUntil, address[] memory alloweds, bool[] memory statuses)

375:   function _isAuthorized(Permission storage $, address account) private view returns (bool) {

386:   function _isSkipped(address account) internal view returns (bool) {

401:   function _setAllowedActor(address actor, bool allowed) internal {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

```solidity
File: src/governance/interfaces/IKatanaV2Factory.sol

21:   function INIT_CODE_PAIR_HASH() external view returns (bytes32);

26:   function allowedAll() external view returns (bool);

42:   function pairImplementation() external view returns (address);

58:   function treasury() external view returns (address);

73:   function getPair(address tokenA, address tokenB) external view returns (address pair);

78:   function allPairs(uint256 index) external view returns (address pair);

83:   function allPairsLength() external view returns (uint256);

94:   function createPair(address tokenA, address tokenB) external returns (address pair);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/interfaces/IKatanaV2Factory.sol)

### <a name="NC-11"></a>[NC-11] Lack of checks in setters

Be it sanity checks (like checks against `0`-values) or initial setting checks: it's best for Setter functions to have them

*Instances (9)*:

```solidity
File: src/governance/KatanaGovernance.sol

88:   function setRouter(address router) external onlyOwner {
        _setRouter(router);

95:   function setAllowedActor(address actor, bool allowed) external onlyOwner {
        _setAllowedActor(actor, allowed);

147:   function setPermission(address token, uint40 whitelistUntil, address[] calldata alloweds, bool[] calldata statuses)
         external
         onlyOwner
       {
         _setPermission(token, whitelistUntil, alloweds, statuses);

157:   function setPairImplementation(address impl) external onlyOwner {
         _v2Factory.setPairImplementation(impl);

164:   function setAllowedAll(bool shouldAllow) external onlyOwner {
         _v2Factory.setAllowedAll(shouldAllow);

171:   function setTreasury(address newTreasury) external onlyOwner {
         _v2Factory.setTreasury(newTreasury);
         _v3Factory.setTreasury(newTreasury);

340:   function _setFactory(address factory) private {
         _v2Factory = IKatanaV2Factory(factory);
     
         emit FactoryUpdated(_msgSender(), factory);

393:   function _setRouter(address router) internal {
         emit RouterUpdated(_msgSender(), _router, router);
         _router = router;

401:   function _setAllowedActor(address actor, bool allowed) internal {
         isAllowedActor[actor] = allowed;
         emit AllowedActorUpdated(actor, allowed);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-12"></a>[NC-12] Missing Event for critical parameters change

Events help non-contract tools to track changes, and events prevent users from being surprised by changes.

*Instances (6)*:

```solidity
File: src/governance/KatanaGovernance.sol

88:   function setRouter(address router) external onlyOwner {
        _setRouter(router);

95:   function setAllowedActor(address actor, bool allowed) external onlyOwner {
        _setAllowedActor(actor, allowed);

147:   function setPermission(address token, uint40 whitelistUntil, address[] calldata alloweds, bool[] calldata statuses)
         external
         onlyOwner
       {
         _setPermission(token, whitelistUntil, alloweds, statuses);

157:   function setPairImplementation(address impl) external onlyOwner {
         _v2Factory.setPairImplementation(impl);

164:   function setAllowedAll(bool shouldAllow) external onlyOwner {
         _v2Factory.setAllowedAll(shouldAllow);

171:   function setTreasury(address newTreasury) external onlyOwner {
         _v2Factory.setTreasury(newTreasury);
         _v3Factory.setTreasury(newTreasury);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-13"></a>[NC-13] NatSpec is completely non-existent on functions that should have them

Public and external functions that aren't view or pure should have NatSpec comments

*Instances (3)*:

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

42:   function katanaV3SwapCallback(int256 amount0Delta, int256 amount1Delta, bytes calldata data) external {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

51:   function initialize(address admin, address factory) external initializer {

68:   function initializeV2(

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-14"></a>[NC-14] Use a `modifier` instead of a `require/if` statement for a special `msg.sender` actor

If a function is supposed to be access-controlled, a `modifier` should be used instead of a `require/if` statement for more readability.

*Instances (3)*:

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

21:     if (!IKatanaGovernance(KATANA_GOVERNANCE).isAuthorized(path, msg.sender)) revert V2UnauthorizedPath();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

50:     if (computePoolAddress(tokenIn, tokenOut, fee) != msg.sender) revert V3InvalidCaller();

150:     if (!IKatanaGovernance(KATANA_GOVERNANCE).isAuthorized(tokens, msg.sender)) revert V3UnauthorizedSwap();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="NC-15"></a>[NC-15] Adding a `return` statement when the function defines a named return variable, is redundant

*Instances (6)*:

```solidity
File: src/governance/KatanaGovernance.sol

176:   /**
        * @inheritdoc IKatanaV2Factory
        */
       function getPair(address tokenA, address tokenB) external view returns (address pair) {
         return _v2Factory.getPair(tokenA, tokenB);

183:   /**
        * @inheritdoc IKatanaV2Factory
        */
       function allPairs(uint256 index) external view returns (address pair) {
         return _v2Factory.allPairs(index);

246:   /**
        * @inheritdoc IKatanaGovernance
        */
       function isAuthorized(address token, address account) public view returns (bool authorized) {
         if (_isSkipped(account)) return true;

255:   /**
        * @inheritdoc IKatanaGovernance
        */
       function isAuthorized(address[] memory tokens, address account) public view returns (bool authorized) {
         if (_isSkipped(account)) return true;
     
         uint256 length = tokens.length;
         for (uint256 i; i < length; ++i) {
           if (!_isAuthorized(_permission[tokens[i]], account)) return false;
         }
     
         return true;

255:   /**
        * @inheritdoc IKatanaGovernance
        */
       function isAuthorized(address[] memory tokens, address account) public view returns (bool authorized) {
         if (_isSkipped(account)) return true;

255:   /**
        * @inheritdoc IKatanaGovernance
        */
       function isAuthorized(address[] memory tokens, address account) public view returns (bool authorized) {
         if (_isSkipped(account)) return true;
     
         uint256 length = tokens.length;
         for (uint256 i; i < length; ++i) {
           if (!_isAuthorized(_permission[tokens[i]], account)) return false;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-16"></a>[NC-16] Take advantage of Custom Error's return value property

An important feature of Custom Error is that values such as address, tokenID, msg.value can be written inside the () sign, this kind of approach provides a serious advantage in debugging and examining the revert details of dapps such as tenderly.

*Instances (19)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

14:     if (block.timestamp > deadline) revert TransactionDeadlinePassed();

41:     if (inputs.length != numCommands) revert LengthMismatch();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

43:     if (bips == 0 || bips > FEE_BIPS_BASE) revert InvalidBips();

63:       if (balance < amountMinimum) revert InsufficientETH();

67:       if (balance < amountMinimum) revert InsufficientToken();

79:       revert InsufficientETH();

95:       revert InsufficientETH();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

21:     if (!IKatanaGovernance(KATANA_GOVERNANCE).isAuthorized(path, msg.sender)) revert V2UnauthorizedPath();

24:       if (path.length < 2) revert V2InvalidPath();

74:     if (amountOut < amountOutMinimum) revert V2TooLittleReceived();

92:     if (amountIn > amountInMaximum) revert V2TooMuchRequested();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

43:     if (amount0Delta <= 0 && amount1Delta <= 0) revert V3InvalidSwap(); // swaps entirely within 0-liquidity regions are not supported

50:     if (computePoolAddress(tokenIn, tokenOut, fee) != msg.sender) revert V3InvalidCaller();

65:         if (amountToPay > maxAmountInCached) revert V3TooMuchRequested();

116:     if (amountOut < amountOutMinimum) revert V3TooLittleReceived();

138:     if (amountOutReceived != amountOut) revert V3InvalidAmountOut();

150:     if (!IKatanaGovernance(KATANA_GOVERNANCE).isAuthorized(tokens, msg.sender)) revert V3UnauthorizedSwap();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

124:     if (!isAuthorized(tokens, sender)) revert Unauthorized();

357:     if (length != statuses.length) revert InvalidLength();

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-17"></a>[NC-17] Avoid the use of sensitive terms

Use [alternative variants](https://www.zdnet.com/article/mysql-drops-master-slave-and-blacklist-whitelist-terminology/), e.g. allowlist/denylist instead of whitelist/blacklist

*Instances (23)*:

```solidity
File: src/governance/KatanaGovernance.sol

135:     uint40 whitelistUntil,

140:     _setPermission(tokenA, whitelistUntil, alloweds, statuses);

141:     _setPermission(tokenB, whitelistUntil, alloweds, statuses);

147:   function setPermission(address token, uint40 whitelistUntil, address[] calldata alloweds, bool[] calldata statuses)

151:     _setPermission(token, whitelistUntil, alloweds, statuses);

272:   function getWhitelistUntil(address token) external view returns (uint40) {

273:     return _permission[token].whitelistUntil;

279:   function getWhitelistedTokensFor(address account)

282:     returns (address[] memory tokens, uint40[] memory whitelistUntils)

287:       whitelistUntils = new uint40[](length);

290:       uint40 whitelistUntil;

296:         whitelistUntil = $.whitelistUntil;

298:         if (block.timestamp < whitelistUntil && $.allowed[account]) {

300:           whitelistUntils[count] = whitelistUntil;

307:         mstore(whitelistUntils, count)

315:   function getManyTokensWhitelistInfo()

318:     returns (address[] memory tokens, uint40[] memory whitelistedUntils)

322:     whitelistedUntils = new uint40[](length);

325:       whitelistedUntils[i] = _permission[tokens[i]].whitelistUntil;

353:   function _setPermission(address token, uint40 whitelistUntil, address[] memory alloweds, bool[] memory statuses)

360:     $.whitelistUntil = whitelistUntil;

367:     emit PermissionUpdated(_msgSender(), token, whitelistUntil, alloweds, statuses);

376:     uint256 expiry = $.whitelistUntil;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-18"></a>[NC-18] Contract does not follow the Solidity style guide's suggested layout ordering

The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be:

1) Type declarations
2) State variables
3) Events
4) Modifiers
5) Functions

However, the contract(s) below do not follow this ordering

*Instances (3)*:

```solidity
File: src/aggregate-router/modules/Payments.sol

1: 
   Current order:
   UsingForDirective.ERC20
   UsingForDirective.SafeTransferLib
   ErrorDefinition.InsufficientToken
   ErrorDefinition.InsufficientETH
   ErrorDefinition.InvalidBips
   ErrorDefinition.InvalidSpender
   VariableDeclaration.FEE_BIPS_BASE
   FunctionDefinition.pay
   FunctionDefinition.payPortion
   FunctionDefinition.sweep
   FunctionDefinition.wrapETH
   FunctionDefinition.unwrapWETH9
   
   Suggested order:
   UsingForDirective.ERC20
   UsingForDirective.SafeTransferLib
   VariableDeclaration.FEE_BIPS_BASE
   ErrorDefinition.InsufficientToken
   ErrorDefinition.InsufficientETH
   ErrorDefinition.InvalidBips
   ErrorDefinition.InvalidSpender
   FunctionDefinition.pay
   FunctionDefinition.payPortion
   FunctionDefinition.sweep
   FunctionDefinition.wrapETH
   FunctionDefinition.unwrapWETH9

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

1: 
   Current order:
   UsingForDirective.V3Path
   UsingForDirective.BytesLib
   UsingForDirective.SafeCast
   ErrorDefinition.V3InvalidSwap
   ErrorDefinition.V3TooLittleReceived
   ErrorDefinition.V3TooMuchRequested
   ErrorDefinition.V3InvalidAmountOut
   ErrorDefinition.V3InvalidCaller
   ErrorDefinition.V3UnauthorizedSwap
   VariableDeclaration.DEFAULT_MAX_AMOUNT_IN
   VariableDeclaration.maxAmountInCached
   VariableDeclaration.MIN_SQRT_RATIO
   VariableDeclaration.MAX_SQRT_RATIO
   FunctionDefinition.katanaV3SwapCallback
   FunctionDefinition.v3SwapExactInput
   FunctionDefinition.v3SwapExactOutput
   FunctionDefinition.checkAuthorizedV3Path
   FunctionDefinition._swap
   FunctionDefinition.computePoolAddress
   
   Suggested order:
   UsingForDirective.V3Path
   UsingForDirective.BytesLib
   UsingForDirective.SafeCast
   VariableDeclaration.DEFAULT_MAX_AMOUNT_IN
   VariableDeclaration.maxAmountInCached
   VariableDeclaration.MIN_SQRT_RATIO
   VariableDeclaration.MAX_SQRT_RATIO
   ErrorDefinition.V3InvalidSwap
   ErrorDefinition.V3TooLittleReceived
   ErrorDefinition.V3TooMuchRequested
   ErrorDefinition.V3InvalidAmountOut
   ErrorDefinition.V3InvalidCaller
   ErrorDefinition.V3UnauthorizedSwap
   FunctionDefinition.katanaV3SwapCallback
   FunctionDefinition.v3SwapExactInput
   FunctionDefinition.v3SwapExactOutput
   FunctionDefinition.checkAuthorizedV3Path
   FunctionDefinition._swap
   FunctionDefinition.computePoolAddress

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

```solidity
File: src/governance/KatanaGovernance.sol

1: 
   Current order:
   UsingForDirective.EnumerableSet.AddressSet
   ErrorDefinition.InvalidLength
   ErrorDefinition.Unauthorized
   VariableDeclaration.__gap
   VariableDeclaration.UNAUTHORIZED
   VariableDeclaration.AUTHORIZED
   VariableDeclaration._v2Factory
   VariableDeclaration._permission
   VariableDeclaration._tokens
   VariableDeclaration.isAllowedActor
   VariableDeclaration._v3Factory
   VariableDeclaration._positionManager
   VariableDeclaration._router
   FunctionDefinition.constructor
   FunctionDefinition.initialize
   FunctionDefinition.initializeV2
   FunctionDefinition.setRouter
   FunctionDefinition.setAllowedActor
   FunctionDefinition.toggleFlashLoanPermission
   FunctionDefinition.enableFeeAmount
   FunctionDefinition.createPair
   FunctionDefinition.createPairAndSetPermission
   FunctionDefinition.setPermission
   FunctionDefinition.setPairImplementation
   FunctionDefinition.setAllowedAll
   FunctionDefinition.setTreasury
   FunctionDefinition.getPair
   FunctionDefinition.allPairs
   FunctionDefinition.allPairsLength
   FunctionDefinition.treasury
   FunctionDefinition.pairImplementation
   FunctionDefinition.INIT_CODE_PAIR_HASH
   FunctionDefinition.getRouter
   FunctionDefinition.getV2Factory
   FunctionDefinition.getV3Factory
   FunctionDefinition.getPositionManager
   FunctionDefinition.isAuthorized
   FunctionDefinition.isAuthorized
   FunctionDefinition.getWhitelistUntil
   FunctionDefinition.getWhitelistedTokensFor
   FunctionDefinition.getManyTokensWhitelistInfo
   FunctionDefinition.allowedAll
   FunctionDefinition._setFactory
   FunctionDefinition._setPermission
   FunctionDefinition._isAuthorized
   FunctionDefinition._isSkipped
   FunctionDefinition._setRouter
   FunctionDefinition._setAllowedActor
   
   Suggested order:
   UsingForDirective.EnumerableSet.AddressSet
   VariableDeclaration.__gap
   VariableDeclaration.UNAUTHORIZED
   VariableDeclaration.AUTHORIZED
   VariableDeclaration._v2Factory
   VariableDeclaration._permission
   VariableDeclaration._tokens
   VariableDeclaration.isAllowedActor
   VariableDeclaration._v3Factory
   VariableDeclaration._positionManager
   VariableDeclaration._router
   ErrorDefinition.InvalidLength
   ErrorDefinition.Unauthorized
   FunctionDefinition.constructor
   FunctionDefinition.initialize
   FunctionDefinition.initializeV2
   FunctionDefinition.setRouter
   FunctionDefinition.setAllowedActor
   FunctionDefinition.toggleFlashLoanPermission
   FunctionDefinition.enableFeeAmount
   FunctionDefinition.createPair
   FunctionDefinition.createPairAndSetPermission
   FunctionDefinition.setPermission
   FunctionDefinition.setPairImplementation
   FunctionDefinition.setAllowedAll
   FunctionDefinition.setTreasury
   FunctionDefinition.getPair
   FunctionDefinition.allPairs
   FunctionDefinition.allPairsLength
   FunctionDefinition.treasury
   FunctionDefinition.pairImplementation
   FunctionDefinition.INIT_CODE_PAIR_HASH
   FunctionDefinition.getRouter
   FunctionDefinition.getV2Factory
   FunctionDefinition.getV3Factory
   FunctionDefinition.getPositionManager
   FunctionDefinition.isAuthorized
   FunctionDefinition.isAuthorized
   FunctionDefinition.getWhitelistUntil
   FunctionDefinition.getWhitelistedTokensFor
   FunctionDefinition.getManyTokensWhitelistInfo
   FunctionDefinition.allowedAll
   FunctionDefinition._setFactory
   FunctionDefinition._setPermission
   FunctionDefinition._isAuthorized
   FunctionDefinition._isSkipped
   FunctionDefinition._setRouter
   FunctionDefinition._setAllowedActor

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="NC-19"></a>[NC-19] Use Underscores for Number Literals (add an underscore every 3 digits)

*Instances (2)*:

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

37:   uint160 internal constant MIN_SQRT_RATIO = 4295128739;

40:   uint160 internal constant MAX_SQRT_RATIO = 1461446703485210103287273052203988822378723970342;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="NC-20"></a>[NC-20] Internal and private variables and functions names should begin with an underscore

According to the Solidity Style Guide, Non-`external` variable and function names should begin with an [underscore](https://docs.soliditylang.org/en/latest/style-guide.html#underscore-prefix-for-non-external-functions-and-variables)

*Instances (15)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

61:   function successRequired(bytes1 command) internal pure returns (bool) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/base/Dispatcher.sol

28:   function dispatch(bytes1 commandType, bytes calldata inputs) internal returns (bool success, bytes memory output) {

215:   function getValueAndData(bytes calldata inputs) internal pure returns (uint256 value, bytes calldata data) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

26:   function pay(address token, address recipient, uint256 value) internal {

42:   function payPortion(address token, address recipient, uint256 bips) internal {

59:   function sweep(address token, address recipient, uint256 amountMinimum) internal {

75:   function wrapETH(address recipient, uint256 amount) internal {

92:   function unwrapWETH9(address recipient, uint256 amountMinimum) internal {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v2/V2SwapRouter.sol

54:   function v2SwapExactInput(

83:   function v2SwapExactOutput(

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

34:   uint256 private maxAmountInCached = DEFAULT_MAX_AMOUNT_IN;

78:   function v3SwapExactInput(

125:   function v3SwapExactOutput(

143:   function checkAuthorizedV3Path(bytes calldata path) internal view {

168:   function computePoolAddress(address tokenA, address tokenB, uint24 fee) private view returns (address pool) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="NC-21"></a>[NC-21] Event is missing `indexed` fields

Index event fields make the field more quickly accessible to off-chain tools that parse events. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Each event should use three indexed fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three fields, all of the fields should be indexed.

*Instances (1)*:

```solidity
File: src/governance/interfaces/IKatanaV2Factory.sol

14:   event PairCreated(address indexed token0, address indexed token1, address pair, uint256 allPairsLength);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/interfaces/IKatanaV2Factory.sol)

### <a name="NC-22"></a>[NC-22] Variables need not be initialized to zero

The default value for variables is zero, so initializing them to zero is superfluous.

*Instances (1)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

44:     for (uint256 commandIndex = 0; commandIndex < numCommands;) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

## Low Issues

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Use a 2-step ownership transfer pattern | 1 |
| [L-2](#L-2) | Some tokens may revert when zero value transfers are made | 3 |
| [L-3](#L-3) | Missing checks for `address(0)` when assigning values to address state variables | 2 |
| [L-4](#L-4) | `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()` | 1 |
| [L-5](#L-5) | Division by zero not prevented | 1 |
| [L-6](#L-6) | Duplicate import statements | 2 |
| [L-7](#L-7) | Empty `receive()/payable fallback()` function does not authenticate requests | 1 |
| [L-8](#L-8) | Initializers could be front-run | 2 |
| [L-9](#L-9) | Loss of precision | 3 |
| [L-10](#L-10) | Solidity version 0.8.20+ may not work on other chains due to `PUSH0` | 6 |
| [L-11](#L-11) | Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership` | 1 |
| [L-12](#L-12) | Sweeping may break accounting if tokens with multiple addresses are used | 4 |
| [L-13](#L-13) | Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting | 1 |
| [L-14](#L-14) | Unsafe ERC20 operation(s) | 1 |
| [L-15](#L-15) | Unspecific compiler version pragma | 1 |
| [L-16](#L-16) | Upgradeable contract is missing a `__gap[50]` storage variable to allow for new storage variables in later versions | 2 |
| [L-17](#L-17) | Upgradeable contract not initialized | 6 |

### <a name="L-1"></a>[L-1] Use a 2-step ownership transfer pattern

Recommend considering implementing a two step process where the owner or admin nominates an account and the nominated account needs to call an `acceptOwnership()` function for the transfer of ownership to fully succeed. This ensures the nominated EOA account is a valid and active account. Lack of two-step procedure for critical operations leaves them error-prone. Consider adding two step procedure on the critical functions.

*Instances (1)*:

```solidity
File: src/governance/KatanaGovernance.sol

12: contract KatanaGovernance is OwnableUpgradeable, IKatanaV2Factory, IKatanaGovernance {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="L-2"></a>[L-2] Some tokens may revert when zero value transfers are made

Example: <https://github.com/d-xo/weird-erc20#revert-on-zero-value-transfers>.

In spite of the fact that EIP-20 [states](https://github.com/ethereum/EIPs/blob/46b9b698815abbfa628cd1097311deee77dd45c5/EIPS/eip-20.md?plain=1#L116) that zero-valued transfers must be accepted, some tokens, such as LEND will revert if this is attempted, which may cause transactions that involve other tokens (such as batch operations) to fully revert. Consider skipping the transfer if the amount is zero, which will also save gas.

*Instances (3)*:

```solidity
File: src/aggregate-router/modules/Payments.sol

34:       ERC20(token).safeTransfer(recipient, value);

51:       ERC20(token).safeTransfer(recipient, amount);

68:       if (balance > 0) ERC20(token).safeTransfer(recipient, balance);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

### <a name="L-3"></a>[L-3] Missing checks for `address(0)` when assigning values to address state variables

*Instances (2)*:

```solidity
File: src/governance/KatanaGovernance.sol

76:     _positionManager = positionManager;

395:     _router = router;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="L-4"></a>[L-4] `abi.encodePacked()` should not be used with dynamic types when passing the result to a hash function such as `keccak256()`

Use `abi.encode()` instead which will pad items to 32 bytes, which will [prevent hash collisions](https://docs.soliditylang.org/en/v0.8.13/abi-spec.html#non-standard-packed-mode) (e.g. `abi.encodePacked(0x123,0x456)` => `0x123456` => `abi.encodePacked(0x1,0x23456)`, but `abi.encode(0x123,0x456)` => `0x0...1230...456`). "Unless there is a compelling reason, `abi.encode` should be preferred". If there is only one argument to `abi.encodePacked()` it can often be cast to `bytes()` or `bytes32()` [instead](https://ethereum.stackexchange.com/questions/30912/how-to-compare-strings-in-solidity#answer-82739).
If all arguments are strings and or bytes, `bytes.concat()` should be used instead

*Instances (1)*:

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

175:               hex"ff", KATANA_V3_FACTORY, keccak256(abi.encode(tokenA, tokenB, fee)), KATANA_V3_POOL_INIT_CODE_HASH

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="L-5"></a>[L-5] Division by zero not prevented

The divisions below take an input parameter which does not have any zero-value checks, which may lead to the functions reverting when zero is passed.

*Instances (1)*:

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

144:     uint256 length = path.length / Constants.NEXT_V3_POOL_OFFSET + 1;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="L-6"></a>[L-6] Duplicate import statements

*Instances (2)*:

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

10: import { Constants } from "../../../libraries/Constants.sol";

13: import { Constants } from "../../../libraries/Constants.sol";

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="L-7"></a>[L-7] Empty `receive()/payable fallback()` function does not authenticate requests

If the intention is for the Ether to be used, the function should call another function, otherwise it should revert (e.g. require(msg.sender == address(weth))). Having no access control on the function means that someone may send Ether to the contract, and have no way to get anything back out, which is a loss of funds. If the concern is having to spend a small amount of gas to check the sender against an immutable address, the code should at least have a function to rescue unused Ether.

*Instances (1)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

66:   receive() external payable { }

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

### <a name="L-8"></a>[L-8] Initializers could be front-run

Initializers could be front-run, allowing an attacker to either set their own values, take ownership of the contract, and in the best case forcing a re-deployment

*Instances (2)*:

```solidity
File: src/governance/KatanaGovernance.sol

51:   function initialize(address admin, address factory) external initializer {

74:   ) external reinitializer(2) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="L-9"></a>[L-9] Loss of precision

Division by large numbers may result in the result being zero, due to solidity not supporting fractions. Consider requiring a minimum amount for the numerator to ensure that it is always larger than the denominator

*Instances (3)*:

```solidity
File: src/aggregate-router/modules/Payments.sol

46:       uint256 amount = (balance * bips) / FEE_BIPS_BASE;

50:       uint256 amount = (balance * bips) / FEE_BIPS_BASE;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

144:     uint256 length = path.length / Constants.NEXT_V3_POOL_OFFSET + 1;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="L-10"></a>[L-10] Solidity version 0.8.20+ may not work on other chains due to `PUSH0`

The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*Instances (6)*:

```solidity
File: src/aggregate-router/AggregateRouter.sol

2: pragma solidity ^0.8.17;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/AggregateRouter.sol)

```solidity
File: src/aggregate-router/base/RouterImmutables.sol

2: pragma solidity ^0.8.17;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/RouterImmutables.sol)

```solidity
File: src/aggregate-router/libraries/Commands.sol

2: pragma solidity ^0.8.17;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/libraries/Commands.sol)

```solidity
File: src/aggregate-router/modules/PaymentsImmutables.sol

2: pragma solidity ^0.8.17;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/PaymentsImmutables.sol)

```solidity
File: src/aggregate-router/modules/katana/KatanaImmutables.sol

2: pragma solidity ^0.8.17;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/KatanaImmutables.sol)

```solidity
File: src/governance/KatanaGovernance.sol

2: pragma solidity ^0.8.23;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="L-11"></a>[L-11] Use `Ownable2Step.transferOwnership` instead of `Ownable.transferOwnership`

Use [Ownable2Step.transferOwnership](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable2Step.sol) which is safer. Use it as it is more secure due to 2-stage ownership transfer.

**Recommended Mitigation Steps**

Use <a href="https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable2Step.sol">Ownable2Step.sol</a>
  
  ```solidity
      function acceptOwnership() external {
          address sender = _msgSender();
          require(pendingOwner() == sender, "Ownable2Step: caller is not the new owner");
          _transferOwnership(sender);
      }
```

*Instances (1)*:

```solidity
File: src/governance/KatanaGovernance.sol

4: import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="L-12"></a>[L-12] Sweeping may break accounting if tokens with multiple addresses are used

There have been [cases](https://blog.openzeppelin.com/compound-tusd-integration-issue-retrospective/) in the past where a token mistakenly had two addresses that could control its balance, and transfers using one address impacted the balance of the other. To protect against this potential scenario, sweep functions should ensure that the balance of the non-sweepable token does not change after the transfer of the swept tokens.

*Instances (4)*:

```solidity
File: src/aggregate-router/base/Dispatcher.sol

85:       } else if (command == Commands.SWEEP) {

95:         Payments.sweep(token, map(recipient), amountMin);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol)

```solidity
File: src/aggregate-router/libraries/Commands.sol

18:   uint256 constant SWEEP = 0x04;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/libraries/Commands.sol)

```solidity
File: src/aggregate-router/modules/Payments.sol

59:   function sweep(address token, address recipient, uint256 amountMinimum) internal {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

### <a name="L-13"></a>[L-13] Consider using OpenZeppelin's SafeCast library to prevent unexpected overflows when downcasting

Downcasting from `uint256`/`int256` in Solidity does not revert on overflow. This can result in undesired exploitation or bugs, since developers usually assume that overflows raise errors. [OpenZeppelin's SafeCast library](https://docs.openzeppelin.com/contracts/3.x/api/utils#SafeCast) restores this intuition by reverting the transaction when such an operation overflows. Using this library eliminates an entire class of bugs, so it's recommended to use it always. Some exceptions are acceptable like with the classic `uint256(uint160(address(variable)))`

*Instances (1)*:

```solidity
File: src/aggregate-router/modules/katana/v3/V3SwapRouter.sol

171:       uint160(

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol)

### <a name="L-14"></a>[L-14] Unsafe ERC20 operation(s)

*Instances (1)*:

```solidity
File: src/aggregate-router/modules/Payments.sol

84:         WETH9.transfer(recipient, amount);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)

### <a name="L-15"></a>[L-15] Unspecific compiler version pragma

*Instances (1)*:

```solidity
File: src/governance/interfaces/IKatanaV2Factory.sol

2: pragma solidity >=0.5.17 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/interfaces/IKatanaV2Factory.sol)

### <a name="L-16"></a>[L-16] Upgradeable contract is missing a `__gap[50]` storage variable to allow for new storage variables in later versions

See [this](https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps) link for a description of this storage variable. While some contracts may not currently be sub-classed, adding the variable now protects against forgetting to add it in the future.

*Instances (2)*:

```solidity
File: src/governance/KatanaGovernance.sol

4: import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

12: contract KatanaGovernance is OwnableUpgradeable, IKatanaV2Factory, IKatanaGovernance {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="L-17"></a>[L-17] Upgradeable contract not initialized

Upgradeable contracts are initialized via an initializer function rather than by a constructor. Leaving such a contract uninitialized may lead to it being taken over by a malicious user

*Instances (6)*:

```solidity
File: src/governance/KatanaGovernance.sol

4: import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

12: contract KatanaGovernance is OwnableUpgradeable, IKatanaV2Factory, IKatanaGovernance {

48:     _disableInitializers();

51:   function initialize(address admin, address factory) external initializer {

68:   function initializeV2(

74:   ) external reinitializer(2) {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

## Medium Issues

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 7 |
| [M-2](#M-2) | Fees can be set to be greater than 100%. | 1 |
| [M-3](#M-3) |  Solmate's SafeTransferLib does not check for token contract's existence | 3 |

### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact

Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (7)*:

```solidity
File: src/governance/KatanaGovernance.sol

88:   function setRouter(address router) external onlyOwner {

95:   function setAllowedActor(address actor, bool allowed) external onlyOwner {

102:   function toggleFlashLoanPermission() external onlyOwner {

138:   ) external onlyOwner returns (address pair) {

157:   function setPairImplementation(address impl) external onlyOwner {

164:   function setAllowedAll(bool shouldAllow) external onlyOwner {

171:   function setTreasury(address newTreasury) external onlyOwner {

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="M-2"></a>[M-2] Fees can be set to be greater than 100%

There should be an upper limit to reasonable fees.
A malicious owner can keep the fee rate at zero, but if a large value transfer enters the mempool, the owner can jack the rate up to the maximum and sandwich attack a user.

*Instances (1)*:

```solidity
File: src/governance/KatanaGovernance.sol

109:   function enableFeeAmount(uint24 fee, int24 tickSpacing, uint8 feeProtocolNum, uint8 feeProtocolDen)
         external
         onlyOwner
       {
         _v3Factory.enableFeeAmount(fee, tickSpacing, feeProtocolNum, feeProtocolDen);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/governance/KatanaGovernance.sol)

### <a name="M-3"></a>[M-3]  Solmate's SafeTransferLib does not check for token contract's existence

There is a subtle difference between the implementation of solmate’s SafeTransferLib and OZ’s SafeERC20: OZ’s SafeERC20 checks if the token is a contract or not, solmate’s SafeTransferLib does not.
<https://github.com/transmissions11/solmate/blob/main/src/utils/SafeTransferLib.sol#L9>
`@dev Note that none of the functions in this library check that a token has code at all! That responsibility is delegated to the caller`

*Instances (3)*:

```solidity
File: src/aggregate-router/modules/Payments.sol

34:       ERC20(token).safeTransfer(recipient, value);

51:       ERC20(token).safeTransfer(recipient, amount);

68:       if (balance > 0) ERC20(token).safeTransfer(recipient, balance);

```

[Link to code](https://github.com/code-423n4/2024-10-ronin/blob/main/katana-operation-contracts/src/aggregate-router/modules/Payments.sol)
