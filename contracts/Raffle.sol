// enter the lottery
// pick a random winner
// winner to be selected automated after x time
// checklink oracle - randomness, automatic executions(chainlink keepers)

// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

error Raffle__NotEnoughETHEntered();

contract Raffle {
    /* state variables */
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable{
        if(msg.value < i_entranceFee) {
            revert Raffle__NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        // fire an event
    }

    function getEntranceFee() public view returns(uint256){
        return i_entranceFee;
    }

    function getPlayers() public view returns(address  payable[]memory){
        return s_players;
    }
}