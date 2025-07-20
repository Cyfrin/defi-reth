// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IERC20} from "../interfaces/IERC20.sol";
import {IStrategyManager} from "../interfaces/eigen-layer/IStrategyManager.sol";
import {IStrategy} from "../interfaces/eigen-layer/IStrategy.sol";
import {IDelegationManager} from
    "../interfaces/eigen-layer/IDelegationManager.sol";
import {IRewardsCoordinator} from
    "../interfaces/eigen-layer/IRewardsCoordinator.sol";
import {
    RETH,
    EIGEN_LAYER_STRATEGY_MANAGER,
    EIGEN_LAYER_STRATEGY_RETH,
    EIGEN_LAYER_DELEGATION_MANAGER,
    EIGEN_LAYER_REWARDS_COORDINATOR,
    EIGEN_LAYER_OPERATOR
} from "../Constants.sol";
import {max} from "../Util.sol";

/// @title EigenLayerRestake
/// @notice This contract allows users to deposit RETH into EigenLayer's staking system,
//          delegate to an operator, and manage withdrawals and rewards.
/// @dev The contract interacts with EigenLayer's StrategyManager, DelegationManager,
//       and RewardsCoordinator to facilitate staking, delegation, and reward claims.
contract EigenLayerRestake {
    IERC20 constant reth = IERC20(RETH);
    IStrategyManager constant strategyManager =
        IStrategyManager(EIGEN_LAYER_STRATEGY_MANAGER);
    IStrategy constant strategy = IStrategy(EIGEN_LAYER_STRATEGY_RETH);
    IDelegationManager constant delegationManager =
        IDelegationManager(EIGEN_LAYER_DELEGATION_MANAGER);
    IRewardsCoordinator constant rewardsCoordinator =
        IRewardsCoordinator(EIGEN_LAYER_REWARDS_COORDINATOR);

    address public owner;

    modifier auth() {
        require(msg.sender == owner, "not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Deposit RETH into the EigenLayer
    /// @param rethAmount The amount of RETH to deposit into EigenLayer
    /// @return shares The number of shares received from the deposit
    /// @dev This function transfers RETH from the user to the contract, approves it for the StrategyManager,
    ///      and then deposits it into the EigenLayer strategy. The user receives shares in return.
    function deposit(uint256 rethAmount) external returns (uint256 shares) {
        // Write your code here
        reth.transferFrom(msg.sender, address(this), rethAmount);
        reth.approve(address(strategyManager), rethAmount);
        shares = strategyManager.depositIntoStrategy(
            address(strategy), address(reth), rethAmount
        );
    }

    /// @notice Delegate staking to a specific operator
    /// @param operator The address of the operator to delegate to
    /// @dev This function allows the owner to delegate their stake to a specified operator.
    ///      The operator will perform actions on behalf of the staker.
    function delegate(address operator) external auth {
        // Write your code here
    }

    /// @notice Undelegate from the current operator and queue a withdrawal
    /// @return withdrawalRoot The root of the withdrawal Merkle tree
    /// @dev This function allows the owner to undelegate from their current operator.
    ///      It also queues a withdrawal from the operator, enabling the user to reclaim their stake.
    function undelegate()
        external
        auth
        returns (bytes32[] memory withdrawalRoot)
    {
        // Write your code here
    }

    /// @notice Withdraw staked RETH from an operator after undelegation
    /// @param operator The address of the operator to withdraw from
    /// @param shares The number of shares to withdraw
    /// @param startBlockNum The block number to start the withdrawal
    /// @dev This function allows the owner to withdraw staked RETH from an operator,
    ///      including the specified number of shares and the block number to begin the withdrawal.
    function withdraw(address operator, uint256 shares, uint32 startBlockNum)
        external
        auth
    {
        // Write your code here
    }

    /* Notes on claim rewards
        struct EarnerTreeMerkleLeaf {
            address earner;
            bytes32 earnerTokenRoot;
        }

        struct TokenTreeMerkleLeaf {
            address token;
            uint256 cumulativeEarnings;
        }

        struct RewardsMerkleClaim {
            uint32 rootIndex;
            uint32 earnerIndex;
            bytes earnerTreeProof;
            EarnerTreeMerkleLeaf earnerLeaf;
            uint32[] tokenIndices;
            bytes[] tokenTreeProofs;
            TokenTreeMerkleLeaf[] tokenLeaves;
        }

        struct DistributionRoot {
            bytes32 root;
            uint32 rewardsCalculationEndTimestamp;
            uint32 activatedAt;
            bool disabled;
        }
    */

    // root
    // - earner leaf 0
    //   - earner 0 address
    //   - earner 0 token root ------+
    // - earner leaf 1               |
    //   - earner 1 address          |
    //   - earner 1 token root       |
    // - earner leaf 2               |
    // ...                           |
    //                               |
    // earner token root <-----------+
    // - token leaf 0
    //   - token 0
    //   - cumulative earnings 0
    // - token leaf 1
    //   - token 1
    //   - cumulative earnings 1
    // - ...

    /// @notice Claim rewards for staked RETH
    /// @param claim The rewards claim data
    /// @dev This function processes a rewards claim by interacting with the RewardsCoordinator.
    ///      It allows the owner to claim rewards associated with their staked RETH.
    function claimRewards(IRewardsCoordinator.RewardsMerkleClaim memory claim)
        external
    {
        // Write your code here
    }

    /// @notice Get the number of shares held in the strategy for the current staker
    /// @return The number of shares held in the EigenLayer strategy
    function getShares() external view returns (uint256) {
        return strategyManager.stakerDepositShares(
            address(this), address(strategy)
        );
    }

    /// @notice Get the withdrawal delay for the current staker
    /// @return The withdrawal delay in blocks
    /// @dev This function returns the maximum of the protocol's minimum withdrawal delay and the strategy's delay.
    function getWithdrawalDelay() external view returns (uint256) {
        uint256 protocolDelay = delegationManager.minWithdrawalDelayBlocks();

        address[] memory strategies = new address[](1);
        strategies[0] = address(strategy);
        uint256 strategyDelay = delegationManager.getWithdrawalDelay(strategies);

        return max(protocolDelay, strategyDelay);
    }

    /// @notice Transfer all of a specific token from the contract to the given address
    /// @param token The address of the token to transfer
    /// @param dst The address to transfer the token to
    /// @dev This function allows the owner to transfer any token from the contract to a specified address.
    function transfer(address token, address dst) external auth {
        IERC20(token).transfer(dst, IERC20(token).balanceOf(address(this)));
    }
}
