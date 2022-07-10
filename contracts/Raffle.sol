// enter the lottery
// pick a random winner
// winner to be selected automated after x time
// checklink oracle - randomness, automatic executions(chainlink keepers)

// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

error Raffle__NotEnoughETHEntered();

contract Raffle is VRFConsumerBaseV2 {
    /* state variables */
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    event RaffleEnter(address indexed player);

    constructor(address vrfCoordinatorV2, uint256 entranceFee) VRFConsumerBaseV2(vrfCoordinatorV2) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        // fire an event
        emit RaffleEnter(msg.sender);
    }

    function requestRandomWinner() external {
        // req the random number
        // do something with it
    }

    // function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords)
    // internal
    // override 
    // {

    // }

    /* view / pure functions */
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return s_players;
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords)
        internal
        virtual
        override
    {}
}
