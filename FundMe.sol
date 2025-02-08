// Declaring the License Identifier, and stating the version of Solidity. 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Get funds from users.
// Withdraw Funds.
// Set a minimum funding value in USD. 

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe
{
    // To attach the functions in PriceConverter to all uint256.
    using PriceConverter for uint256;

    // Creating a variable to store the minimum funding value in USD.
    uint256 public minimumUsd = 5 * (10 ** 18); //5e18 or 5 * 1e18

    // Creating an array called "funders" to keep track of users who send money to this contract. 
    address[] funders;
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    // Function called to send money to the contract. 
    function fund() public payable 
    {
        // Questions:
        // Allow users to send money.
        // Have a minimum Dollar amount they have to send. 
        // How do we send ETH to this contract? 
        
        require(msg.value.getConversionRate() >= minimumUsd, "Not enough ETH was sent.");
        // require(getConversionRate(msg.value) >= minimumUsd, "Not enough ETH was sent.");
        // require(msg.value >= minimumUsd, "Amount must be higher than minimum USD value.");
        
        // Adding current address to the array of funders.
        funders.push(msg.sender);

        // When somone funds the contract we see what they added plus what they have previously added. 
        // Keeping track of funders sending money to our contract and mapping it to look at how much they've sent.
        addressToAmountFunded[msg.sender] += msg.value; 
        // addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // Function called when users want to view the funds. 
    function getFund() public view returns (address[] memory) {

        return funders;
    }



    // Withdraw funds from contract. Only owner of the contract can withdraw.
    function withdraw() public 
    {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex + 1 /* funderIndex++ */)
        {
            // To access the zeroth index of the funders array.
            address funder = funders[funderIndex];

            // Reset the mapping
            addressToAmountFunded[funder] = 0;
            
        }
    }

    // function getVersion() public view returns(uint256)
    // {
    //     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    //     return priceFeed.version();

    //     // return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    // }
}
// uint256 public function getVersion() public view returns (uint256)

 