# Ronin audit details

- Total Prize Pool: $50,000 in USDC
  - HM awards: $39,800 in USDC
  - QA awards: $1,700 in USDC
  - Judge awards: $4,800 in USDC
  - Scout awards: $500 in USDC
- [Read our guidelines for more details](https://docs.code4rena.com/roles/wardens)
- Starts October 16, 2024 20:00 UTC
- Ends October 30, 2024 20:00 UTC

## Automated Findings / Publicly Known Issues

The 4naly3er report can be found [here](https://github.com/code-423n4/2024-10-ronin/blob/main/4naly3er-report.md).
The Slither outputs can be found [here](https://github.com/code-423n4/2024-10-ronin/blob/main/slither-katana-operation-contracts.txt) and [here](https://github.com/code-423n4/2024-10-ronin/blob/main/slither-katana-v3-contracts.txt)

*Note for C4 wardens: Anything included in this `Automated Findings / Publicly Known Issues` section is considered a publicly known issue and is ineligible for awards.*

- Centralization risk. Sky Mavis is responsible for maintaining the Katana V3 contracts and will able to upgrade the contract if necessary, as well as specify additional fee tiers.
- All public known issues, including public audit reports of Uniswap V3 that affect Katana V3
- If a liquidity pool (pair of tokens) is already open for liquidity provision on Katana V2, liquidity providers are expected to be able to migrate their liquidity to the corresponding pool on Katana V3 when it is created, without being restricted by the authorization function of the Governance.

# Overview

Katana v3 is a decentralized exchange (DEX) protocol built on the foundations of Uniswap V3. It retains core features like concentrated liquidity, protocol fees, and the integrated price oracle mechanism. However, Katana v3 introduces key modifications to better align with specific project objectives.

### Key Changes from Uniswap V3
- **Customizable Protocol Fee Tiers**: Katana v3 allows for flexible fee structures with multiple protocol fee tiers, improving adaptability across different market conditions and asset types.
- **Authorized Protocol Actions**: Certain actions within the protocol are managed more systematically through authorization, improving operational integrity and efficiency.
- **Feature Simplification**: Unused features from Uniswap V3, such as NFT trading and protocol fee collection, were removed to streamline functionality and reduce complexity.

## Links

- **Previous audits:** None
- **Documentation:** [docs.roninchain.com/apps/katana](https://docs.roninchain.com/apps/katana) (Please note, this documentation is for the current version (Katana V2), not the version in scope for this audit. However, reading the docs is recommended for context.)
- **Website:** [welcome.skymavis.com](https://welcome.skymavis.com/)
- **X/Twitter:** [AxieInfinity](https://x.com/AxieInfinity)
- **Discord:** [discord.com/invite/axie](https://discord.com/invite/axie)

---

# Scope

### Files in scope

|File                                                                                       |      code
|-------------------------------------------------------------------------------------------|----------
|katana-v3-contracts/src/core/KatanaV3Pool.sol                                              |       566
|katana-v3-contracts/src/periphery/NonfungiblePositionManager.sol                           |       320
|katana-operation-contracts/src/governance/KatanaGovernance.sol                             |       227
|katana-operation-contracts/src/aggregate-router/base/Dispatcher.sol                        |       176
|katana-v3-contracts/src/periphery/lens/MixedRouteQuoterV1.sol                              |       150
|katana-operation-contracts/src/aggregate-router/modules/katana/v3/V3SwapRouter.sol         |       126
|katana-v3-contracts/src/periphery/NonfungibleTokenPositionDescriptor.sol                   |        91
|katana-v3-contracts/src/periphery/V3Migrator.sol                                           |        85
|katana-v3-contracts/src/core/KatanaV3Factory.sol                                           |        77
|katana-operation-contracts/src/aggregate-router/modules/Payments.sol                       |        73
|katana-operation-contracts/src/aggregate-router/modules/katana/v2/V2SwapRouter.sol         |        71
|katana-v3-contracts/src/periphery/libraries/KatanaV2Library.sol                            |        71
|katana-v3-contracts/src/periphery/libraries/KatanaV2LibraryTestnet.sol                     |        71
|katana-operation-contracts/src/aggregate-router/AggregateRouter.sol                        |        49
|katana-v3-contracts/src/core/interfaces/pool/IKatanaV3PoolEvents.sol                       |        49
|katana-v3-contracts/src/core/interfaces/pool/IKatanaV3PoolState.sol                        |        47
|katana-v3-contracts/src/periphery/interfaces/IKatanaV2Pair.sol                             |        44
|katana-v3-contracts/src/external/interfaces/IKatanaGovernance.sol                          |        43
|katana-v3-contracts/src/periphery/interfaces/IMixedRouteQuoterV1.sol                       |        28
|katana-v3-contracts/src/periphery/base/PoolInitializer.sol                                 |        27
|katana-v3-contracts/src/periphery/libraries/PoolAddress.sol                                |        26
|katana-v3-contracts/src/core/KatanaV3PoolDeployer.sol                                      |        25
|katana-operation-contracts/src/aggregate-router/modules/katana/KatanaImmutables.sol        |        22
|katana-operation-contracts/src/aggregate-router/libraries/Commands.sol                     |        20
|katana-v3-contracts/src/core/interfaces/IKatanaV3Factory.sol                               |        19
|katana-operation-contracts/src/governance/interfaces/IKatanaV2Factory.sol                  |        16
|katana-v3-contracts/src/core/KatanaV3PoolProxy.sol                                         |        16
|katana-operation-contracts/src/aggregate-router/modules/PaymentsImmutables.sol             |        15
|katana-v3-contracts/src/core/interfaces/IKatanaV3Pool.sol                                  |        13
|katana-v3-contracts/src/core/interfaces/pool/IKatanaV3PoolImmutables.sol                   |        13
|katana-v3-contracts/src/periphery/base/PeripheryImmutableState.sol                         |        13
|katana-operation-contracts/src/aggregate-router/base/RouterImmutables.sol                  |        10
|katana-v3-contracts/src/external/libraries/AuthorizationLib.sol                            |        10
|katana-v3-contracts/src/core/KatanaV3PoolBeacon.sol                                        |         9
|katana-v3-contracts/src/core/interfaces/IKatanaV3PoolDeployer.sol                          |         8
|katana-v3-contracts/src/periphery/interfaces/IPeripheryImmutableState.sol                  |         6
|katana-v3-contracts/src/core/interfaces/IKatanaV3PoolBeaconImmutables.sol                  |         5
|SUM:                                                                                       |      2637

If you discover a bug in any contract or library outside of the files listed above that impact following contracts, we will consider the issue valid:

- KatanaGovernance
- AggregateRouter
- KatanaV3Factory
- NonfungiblePositionManager
- V3Migrator
- KatanaV3PoolBeacon
- KatanaV3Pool

`KatanaGovernance`, `KatanaV3Factory`, `NonfungiblePositionManager` contracts are deployed with transparent proxy. 

**All vulnerabilities in the `KatanaGovernance` contract that do not affect user funds will have their severity downgraded by one level.**

#### Priority files

katana-v3-contracts:

```
src/core/KatanaV3PoolProxy.sol
src/core/KatanaV3Pool.sol
src/core/KatanaV3Factory.sol
src/periphery/NonfungiblePositionManager.sol
src/periphery/V3Migrator.sol
```

katana-operation-contracts:

```
src/aggregate-router/AggregateRouter.sol
src/aggregate-router/modules/katana/v2/V2SwapRouter.sol
src/aggregate-router/modules/katana/v3/V3SwapRouter.sol
```

### Files out of scope

These files are explicitly out of scope:

```
katana-v3-contracts/src/periphery/SwapRouter.sol
katana-v3-contracts/src/periphery/examples/PairFlash.sol
katana-v3-contracts/src/periphery/libraries/KatanaV2LibraryTestnet.sol
katana-v3-contracts/src/periphery/lens/MixedRouteQuoterV1Testnet.sol
```

## Scoping Q &amp; A

### General questions

| Question                                | Answer                       |
| --------------------------------------- | ---------------------------- |
| ERC20 used by the protocol              |       Any (all possible ERC20s)             |
| ERC721 used  by the protocol            |           N/A           |
| ERC777 used by the protocol             |           N/A            |
| ERC1155 used by the protocol            |           N/A           |
| Chains the protocol will be deployed on | Ronin  |

### ERC20 token behaviors in scope

| Question                                                                                                                                                   | Answer |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| [Missing return values](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#missing-return-values)                                                      |   Out of scope  |
| [Fee on transfer](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#fee-on-transfer)                                                                  |  Out of scope  |
| [Balance changes outside of transfers](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#balance-modifications-outside-of-transfers-rebasingairdrops) | Out of scope    |
| [Upgradeability](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#upgradable-tokens)                                                                 |   Out of scope  |
| [Flash minting](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#flash-mintable-tokens)                                                              | Out of scope    |
| [Pausability](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#pausable-tokens)                                                                      | Out of scope    |
| [Approval race protections](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#approval-race-protections)                                              | Out of scope    |
| [Revert on approval to zero address](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-approval-to-zero-address)                            | Out of scope    |
| [Revert on zero value approvals](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-zero-value-approvals)                                    | Out of scope    |
| [Revert on zero value transfers](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-zero-value-transfers)                                    | Out of scope    |
| [Revert on transfer to the zero address](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-transfer-to-the-zero-address)                    | Out of scope    |
| [Revert on large approvals and/or transfers](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-large-approvals--transfers)                  | Out of scope    |
| [Doesn't revert on failure](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#no-revert-on-failure)                                                   |  Out of scope   |
| [Multiple token addresses](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#revert-on-zero-value-transfers)                                          | Out of scope    |
| [Low decimals ( < 6)](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#low-decimals)                                                                 |   Out of scope  |
| [High decimals ( > 18)](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#high-decimals)                                                              | Out of scope    |
| [Blocklists](https://github.com/d-xo/weird-erc20?tab=readme-ov-file#tokens-with-blocklists)                                                                | Out of scope    |

### External integrations (e.g., Uniswap) behavior in scope

| Question                                                  | Answer |
| --------------------------------------------------------- | ------ |
| Enabling/disabling fees (e.g. Blur disables/enables fees) | Yes   |
| Pausability (e.g. Uniswap pool gets paused)               |  Yes   |
| Upgradeability (e.g. Uniswap gets upgraded)               |   Yes  |

### EIP compliance checklist

N/A

# Additional context

## Main invariants

- User can remove their provided liquidity
- Only owner can add fee tier as well as enable flash loan feature
- Protocol fees will be directly transferred to the treasury without fee-collecting operations needed

## Attack ideas (where to focus for bugs)

- Funds blocking
- Stealing of funds
- Protocol insolvency
- Fee distribution logic
- Access control on pool contract
- Contract upgradability patterns

## All trusted roles in the protocol

| Role                                |
| --------------------------------------- |
| Proxy Admin                          |
| Governance Owner                             |
| Beacon Owner                          |
| Factory Owner (i.e. the Governance contract)                       |

## Describe any novel or unique curve logic or mathematical models implemented in the contracts

N/A


## Assumptions
As [Uniswap V3](https://github.com/Uniswap/v3-core/blob/main/bug-bounty.md#assumptions), Katana V3 was developed with the following assumptions, and thus any bug must also adhere to the following assumptions to be valid:
- The total supply of any token does not exceed 2<sup>128</sup> - 1, i.e. `type(uint128).max`.
- The `transfer` and `transferFrom` methods of any token strictly decrease the balance of the token sender by the transfer amount and increases the balance of token recipient by the transfer amount, i.e. fee on transfer tokens are excluded.
- The token balance of an address can only change due to a call to `transfer` by the sender or `transferFrom` by an approved address, i.e. rebase tokens and interest bearing tokens are excluded.
- If a liquidity pool (pair of tokens) is already open for liquidity provision on Katana V2, liquidity providers are expected to be able to migrate their liquidity to the corresponding pool on Katana V3 when it is created, without being restricted by the authorization function of the Governance.


## Testnet deploy
All contracts are deployed on Saigon testnet. Note that these on-chain contracts are provided for testing purpose and not considered as in-scope assets.
- KatanaGovernance [0x247F12836A421CDC5e22B93Bf5A9AAa0f521f986](https://saigon-app.roninchain.com/address/0x247F12836A421CDC5e22B93Bf5A9AAa0f521f986)
- KatanaV3PoolBeacon [0xCd198eaa03ffaB139c1350c91A8a9D8ce95354C5](https://saigon-app.roninchain.com/address/0xCd198eaa03ffaB139c1350c91A8a9D8ce95354C5)
- AggregateRouter [0x8Cd8F15E956636e6527d2EC2ea669675A74153CF](https://saigon-app.roninchain.com/address/0x8Cd8F15E956636e6527d2EC2ea669675A74153CF)
- KatanaV3Factory [0x4E7236ff45d69395DDEFE1445040A8f3C7CD8819](https://saigon-app.roninchain.com/address/0x4E7236ff45d69395DDEFE1445040A8f3C7CD8819)
- NonfungiblePositionManager [0x7C2716803c09cd5eeD78Ba40117084af3c803565](https://saigon-app.roninchain.com/address/0x7C2716803c09cd5eeD78Ba40117084af3c803565)
- V3Migrator [0x8cF4743642acF849eff54873e24d46D0f3437593](https://saigon-app.roninchain.com/address/0x8cF4743642acF849eff54873e24d46D0f3437593)
- TickLens [0x812F9B77473D8847767cfFF087B49b628458fc65](https://saigon-app.roninchain.com/address/0x812F9B77473D8847767cfFF087B49b628458fc65)
- QuoterV2 [0xB2Cc117Ed42cBE07710C90903bE46D2822bcde45](https://saigon-app.roninchain.com/address/0xB2Cc117Ed42cBE07710C90903bE46D2822bcde45)
- KatanaInterfaceMulticall [0x5938EF96F0C7c75CED7132D083ff08362C7FF70a](https://saigon-app.roninchain.com/address/0x5938EF96F0C7c75CED7132D083ff08362C7FF70a)
- MixedRouteQuoterV1Testnet [0x9FC1eaBd6C8fCFbd2c43c3641DC612Ffa61fcACd](https://saigon-app.roninchain.com/address/0x9FC1eaBd6C8fCFbd2c43c3641DC612Ffa61fcACd)
- Permit2 [0xCcf4a457E775f317e0Cf306EFDda14Cc8084F82C](https://saigon-app.roninchain.com/address/0xCcf4a457E775f317e0Cf306EFDda14Cc8084F82C)

## Running tests

katana-v3-contracts:

```
git clone https://github.com/ronin-chain/katana-v3-contracts --recurse
cd katana-v3-contracts && git checkout release/v1.0.0
forge build
```

katana-operation-contracts:

```
git clone https://github.com/ronin-chain/katana-operation-contracts --recurse
cd katana-operation-contracts && git checkout release/v1.0.0
forge build
```

## Miscellaneous

Employees of Sky Mavis / Ronin and employees' family members are ineligible to participate in this audit.

Code4rena's rules cannot be overridden by the contents of this README. In case of doubt, please check with C4 staff.
