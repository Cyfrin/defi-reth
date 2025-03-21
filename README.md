# Rocket Pool rETH Integration

[contributors-shield]: https://img.shields.io/github/contributors/cyfrin/defi-reth.svg?style=for-the-badge
[contributors-url]: https://github.com/cyfrin/defi-reth/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/cyfrin/defi-reth.svg?style=for-the-badge
[forks-url]: https://github.com/cyfrin/defi-reth/network/members
[stars-shield]: https://img.shields.io/github/stars/cyfrin/defi-reth.svg?style=for-the-badge
[stars-url]: https://github.com/cyfrin/defi-reth/stargazers
[issues-shield]: https://img.shields.io/github/issues/cyfrin/defi-reth.svg?style=for-the-badge
[issues-url]: https://github.com/cyfrin/defi-reth/issues
[license-shield]: https://img.shields.io/github/license/cyfrin/defi-reth.svg?style=for-the-badge
[license-url]: https://github.com/cyfrin/defi-reth/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555

<p align="center"><strong>Learn smart contract development, and level up your career
</strong></p>

[![Stargazers][stars-shield]][stars-url] [![Forks][forks-shield]][forks-url] [![Contributors][contributors-shield]][contributors-url] [![Issues][issues-shield]][issues-url] [![GPLv3 License][license-shield]][license-url]

<p align="center">
    <br />
    <a href="https://cyfrin.io/">
        <img src=".github/images/poweredbycyfrinbluehigher.png" width="145" alt=""/></a>
<a href="https://updraft.cyfrin.io/courses/moccasin">
        <img src=".github/images/coursebadge.png" width="242.3" alt=""/></a>
    <br />
</p>

</div>

This repository houses course resources and [discussions](https://github.com/Cyfrin/defi-reth/discussions) for the course.

Please refer to this for an in-depth explanation of the content:

- [Website](https://updraft.cyfrin.io) - Join Cyfrin Updraft and enjoy 50+ hours of smart contract development courses
- [Twitter](https://twitter.com/CyfrinUpdraft) - Stay updated with the latest course releases
- [LinkedIn](https://www.linkedin.com/school/cyfrin-updraft/) - Add Updraft to your learning experiences
- [Discord](https://discord.gg/cyfrin) - Join a community of 3000+ developers and auditors
- [Codehawks](https://codehawks.com) - Smart contracts auditing competitions to help secure web3

### Prerequisites

- Intermediate Solidity
- Experience with Foundry
- Basic DeFi knowledge such as DAI, WETH and AMM.

### Setup Foundry

```shell
cd foundry
forge build
```

### Understanding rETH

> **Topics**
>
> - What is rETH?
> - How to calculate rETH / ETH exchange rates
> - Several ways to acquire rETH and how to redeem ETH

- What is rETH
  - [ETH staking](./notes/eth-stake.png)
  - [What problem does Rocket Pool solve?](./notes/rocket-pool.png)
  - [What is rETH?](./notes/reth.png)
  - [Value of rETH](./notes/reth.png)
    - [Rebase vs non-rebase token](./notes/reth-rebase.png)
- [rETH contract overview](./notes/reth-flow.png)
- Exchange rates
  - How exchange rate is calculated
    - [Math](./notes/reth-exchange-rate.png)
    - Comments on code
      - [`RocketDepositPool.deposit`](https://github.com/rocket-pool/rocketpool/blob/fb53ec9ee9546faea70799ac8903005300eec9d6/contracts/contract/deposit/RocketDepositPool.sol#L90-L127)
      - [`RocketTokenRETH.mint`](https://github.com/rocket-pool/rocketpool/blob/fb53ec9ee9546faea70799ac8903005300eec9d6/contracts/contract/token/RocketTokenRETH.sol#L94-L103)
      - [`RocketTokenRETH.burn`](https://github.com/rocket-pool/rocketpool/blob/fb53ec9ee9546faea70799ac8903005300eec9d6/contracts/contract/token/RocketTokenRETH.sol#L106-L123)
    - Foundry exercises
      - [Calculate exchange rate from ETH to rETH](./foundry/exercises/exercise-calc-ex-rate-eth-reth.md)
      - [Calculate exchange rate from rETH to ETH](./foundry/exercises/exercise-calc-ex-rate-reth-eth.md)
- Availability and deposit delay
  - Foundry exercises
    - [Get availability](./foundry/exercises/exercise-get-avail.md)
    - [Get deposit delay](./foundry/exercises/exercise-get-deposit-delay.md)
    - [Get last user deposit block](./foundry/exercises/exercise-get-last-user-deposit-block.md)
- Swapping between ETH and rETH
  - Foundry exercises
    - [Rocket Pool (ETH to rETH)](./foundry/exercises/exercise-swap-rocket-pool-eth-reth.md)
    - [Rocket Pool (rETH to ETH)](./foundry/exercises/exercise-swap-rocket-pool-reth-eth.md)
    - [Uniswap V3 (WETH to rETH)](./foundry/exercises/exercise-swap-uni-v3-weth-reth.md)
    - [Uniswap V3 (rETH to WETH)](./foundry/exercises/exercise-swap-uni-v3-reth-weth.md)
    - [Balancer V2 (WETH to rETH)](./foundry/exercises/exercise-swap-balancer-v2-weth-reth.md)
    - [Balancer V2 (rETH to WETH)](./foundry/exercises/exercise-swap-balancer-v2-reth-weth.md)

### DeFi Integrations

> **Topics**
>
> - DeFi integration with rETH
> - Flash leverage with Aave V3
> - Liquidity to Balancer V2 and Aura
> - Restake into EigenLayer

- Leverage rETH
  - What we are building
  - [What is AAVE](./notes/aave.png)
  - [What is leverage](./notes/leverage.png)
  - [Math](./notes/max-leverage.png)
  - [Flash leverage flow](./notes/flash-lev.png)
  - [Flash leverage math](./notes/flash-lev.png)
  - [Application design](./notes/flash-lev-design.png)
  - Foundry exercises
    - [Get max flash loan amount](./foundry/exercises/exercise-aave-flash-lev-get-max-loan.md)
    - [Open a leveraged position](./foundry/exercises/exercise-aave-flash-lev-open.md)
    - [Close a leveraged position](./foundry/exercises/exercise-aave-flash-lev-close.md)
    - [How to setup and execute scripts](./foundry/README.md)
    - Transactions
      - [Proxy](https://etherscan.io/address/0xC5aCD8c4604476FEFfd4bEb164a22f70ed56884D)
      - [FlashLev](https://etherscan.io/address/0xDcc6Dc8D59626E4E851c6b76df178Ab0C390bAF8)
      - [Aave flash leverage open position tx](https://etherscan.io/tx/0x79c5fb4ab1b5fc87842643410aa058c8b634650d5da16eb24728cc6ef793554b)
      - [Aave flash leverage close position tx (profit 2.5813 DAI)](https://etherscan.io/tx/0x03778694892ac46b37269e9ea0f64bd100326faa3abbb2b235a6dd3d15c3d240)
- Provide liquidity to Balancer / Aura
  - [What is Balancer](./notes/balancer-v2.png)
  - [What is Aura](./notes/balancer-v2.png)
  - Balancer UI walkthrough transactions
    - [Add liquidity](https://etherscan.io/tx/0x8cce73567eef34d20c435a336ed0bbc667ca5937a3d7c7d876f0f9cf89766a80)
    - [Stake LP to Liquidity Gauge](https://etherscan.io/tx/0x507b35b84d1685a7c6e5a79f0f17024096e4f042b246047932a28b2de4d03c14)
    - [Add BAL/WETH liquidity](https://etherscan.io/tx/0x0612d067b5220750569b901400b3f2624ed0e5488ffeba3ae5e62a86e65bb99f)
    - [Lock BAL/WETH LP](https://etherscan.io/tx/0x1fd35f3b2d2fc146f087af52a90013784aa20fddde00b95ec82c2a7d19e9ba61)
    - [Vote for rewards to rETH/WETH pool](https://etherscan.io/tx/0x0c523f52cedb207d93ef0db682c84dc0c601444480497ae13df832abccaee89b)
    - [Claim rewards](https://etherscan.io/tx/0x52c10c465eb39ca9bace336eb1c95cda3bc8df5767c6e56aaaaf98143131029e)
    - [Unlock veBAL](https://etherscan.io/tx/0xa37ab34a024f612f4777c0734f561db6d6d0b3cf718e12a4e83da480812d882a)
    - [Unstake LP](https://etherscan.io/tx/0x8d36daed733b7214fd24a79fd10019159936e594d4f4a1c225727766a9501cf1)
    - [Remove RETH/WETH liquidity](https://etherscan.io/tx/0x8655822fc1fd9e457758b33ecce129d77bd434553096aea8950634f7c6fd7f1a)
    - [Remove BAL/WETH liquidity](https://etherscan.io/tx/0x6b84c2895a926cc0734a83c1a309a84caff64ab18942c434568d59ca505069e9)
  - Aura UI walkthrough transactions
    - [Deposit rETH](https://etherscan.io/tx/0xb93f1c4ed66b7a92661c2350e95553811008618ec5921867977e37aca8e3ba09)
    - [Claim rewards](https://etherscan.io/tx/0x6f981d560c77e30588af65e28fd6d1c604bdb3fc55f0c42d4bac01f34ec88065)
    - [Withdraw rETH / ETH BPT](https://etherscan.io/tx/0x5cdbd6f404da7fb9ef422b4c84b8df065c6b8b69db6f7be98d127c044a41c2ba)
  - Foundry exercises
    - [Balancer add liquidity](./foundry/exercises/exercise-balancer-join.md)
    - [Balancer remove liquidity](./foundry/exercises/exercise-balancer-exit.md)
    - [Aura add liquidity](./foundry/exercises/exercise-aura-deposit.md)
    - [Aura get reward](./foundry/exercises/exercise-aura-get-reward.md)
    - [Aura remove liquidity](./foundry/exercises/exercise-aura-exit.md)
- Rocket Pool NAV oracle
  - [What is NAV oracle](./notes/rocket-pool-nav.png)
    - [Query live data](https://etherscan.io/address/0xae78736cd615f374d3085123a210448e74fc6393#readContract#F6)
    - Foundry exercise
      - [rETH NAV](./foundry/exercises/exercise-reth-nav.md)
- Restake on EigenLayer
  - [What is EigenLayer - problem](./notes/eigen-layer.png)
  - [What is EigenLayer - solution](./notes/eigen-layer.png)
  - [How it works](./notes/eigen-layer.png)
  - [Contract architecture](./notes/eigen-layer-contract-arch.png)
  - [Reward Merkle tree diagram](./notes/eigen-layer-reward-merkle.png)
  - Transactions
    - [Deposit rETH](https://etherscan.io/tx/0xfb709b9a4b33371970e4fb3bcd3aefe8f20a97a373336feef5e42d49282d91c2)
    - [Delegate](https://etherscan.io/tx/0xda7b7122bcb9c9d0f7cd111683a85ecb3c514ab5f14f1d412ad102804d02fe94)
    - [Claim rewards](https://etherscan.io/tx/0x29226a1cb445faa3e1e7850f4f669a9e028e21c30f1c50137fdd2885ddd30df6)
    - [Queue withdraw of rETH](https://etherscan.io/tx/0xc4e7a7c6556fb40dbeada645634cea8c8c7bb47b8f5e04858d8f4cd2d04bf02a)
    - [Withdraw rETH](https://etherscan.io/tx/0x743a95867d308ae24332cd34c73762d14254b3aa7d2239aee1266ea65e810bf7)
  - Foundry exercises
    - [Deposit](./foundry/exercises/exercise-eigen-layer-deposit.md)
    - [Delegate](./foundry/exercises/exercise-eigen-layer-delegate.md)
    - [Undelegate](./foundry/exercises/exercise-eigen-layer-undelegate.md)
    - [Withdraw](./foundry/exercises/exercise-eigen-layer-withdraw.md)
    - [Claim rewards](./foundry/exercises/exercise-eigen-layer-claim-rewards.md)
- [L2 tokens](https://rocketpool.net/protocol/integrations)

### Resources

##### ETH Staking

- [ETH staking](https://ethereum.org/en/staking/)
- [Deposit contract](https://etherscan.io/address/0x00000000219ab540356cBB839Cbe05303d7705Fa)

##### Rocket Pool

- [Rocket Pool GitHub](https://github.com/rocket-pool/rocketpool)
- [Rocket Pool Contracts and integrations](https://docs.rocketpool.net/overview/contracts-integrations)
- [rETH](https://etherscan.io/address/0xae78736cd615f374d3085123a210448e74fc6393)
- [Chainlink rETH / ETH](https://data.chain.link/feeds/ethereum/mainnet/reth-eth)
- [Chainlink addresses](https://docs.chain.link/data-feeds#price-feeds)
- [RocketDepositPool](https://etherscan.io/address/0xDD3f50F8A6CafbE9b31a427582963f465E745AF8)
- [RocketNetworkBalances](https://etherscan.io/address/0x6Cc65bF618F55ce2433f9D8d827Fc44117D81399)
- [RocketDAOProtocolSettingsDeposit](https://etherscan.io/address/0xD846AA34caEf083DC4797d75096F60b6E08B7418)

##### Aave

- [Aave error codes](https://github.com/aave/aave-v3-core/blob/master/contracts/protocol/libraries/helpers/Errors.sol)

##### Aave Flash Leverage

- [Proxy](https://etherscan.io/address/0xC5aCD8c4604476FEFfd4bEb164a22f70ed56884D)
- [FlashLev](https://etherscan.io/address/0xDcc6Dc8D59626E4E851c6b76df178Ab0C390bAF8)
- [Aave flash leverage open position tx](https://etherscan.io/tx/0x79c5fb4ab1b5fc87842643410aa058c8b634650d5da16eb24728cc6ef793554b)
- [Aave flash leverage close position tx (profit 2.5813 DAI)](https://etherscan.io/tx/0x03778694892ac46b37269e9ea0f64bd100326faa3abbb2b235a6dd3d15c3d240)

##### Balancer

- [Balancer](https://balancer.fi/)
- [Balancer docs](https://docs.balancer.fi/)
- [Balancer V2 GitHub](https://github.com/balancer/balancer-v2-monorepo)
- [Balancer V2 rETH/WETH pool](https://balancer.fi/pools/ethereum/v2/0x1e19cf2d73a72ef1332c882f20534b6519be0276000200000000000000000112)

##### Aura

- [Aura](https://aura.finance/)
- [Aura GitHub](https://github.com/aurafinance/aura-contracts)
- [Aura GitHub convex fork](https://github.com/aurafinance/convex-platform)
- [Balancer - Aura Ceazor'sSnack Sandwich](https://www.youtube.com/watch?v=1VQ3hdnn3yc)

##### Curve

- [Curve](https://curve.fi/)

##### EigenLayer

- [Eigenlayer](https://www.eigenlayer.xyz/)
- [Eigenlayer GitHub](https://github.com/Layr-Labs/eigenlayer-contracts)
- [Eigenlayer flow](https://github.com/Layr-Labs/eigenlayer-contracts/tree/dev/docs#common-user-flows)
- [Eigenlayer testnet](https://holesky.eigenlayer.xyz/)
- [You Could've Invented EigenLayer](https://www.blog.eigenlayer.xyz/ycie/)
- [EigenLayer Explained: What is Restaking?](https://www.youtube.com/watch?v=5r0SooSQFJg)
