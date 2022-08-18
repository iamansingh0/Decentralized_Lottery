//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error Raffle_NotEnoughEthEntered();

contract Raffle {
    /* State Variables */
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /* Events */
    event RaffleEnter(address indexed player);

    constructor(uint256 fee)
    {
        i_entranceFee = fee;
    }

    function enterRaffle() public payable{
        if(msg.value < i_entranceFee) {
            revert Raffle_NotEnoughEthEntered();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEnter(msg.sender);
    }

    // function pickRandomWinner() {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}