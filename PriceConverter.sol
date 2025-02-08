// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter
{
         // Creating a function "getPrice" to get the price of ETH in terms of USD.
    function getPrice() internal view returns (uint256)
    {  
        // Two things will be required to communicate with the contrct address from chainlink. 
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI: 

        // Getting USD price from chainlink.org.
        // Reference: https://docs.chain.link/docs/ethereum-oracle/.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        // Price of ETH in terms of USD.
        // Getting the price of ETH in USD based on its decimal value. 
        (, int256 answer, , ,) = priceFeed.latestRoundData();
        
        // Convert price based on Decimal value of ETH. 
        return uint256(answer * 1e10);

    }


    // Creating a function "getConversionRate" to convert the "msg.value" based on the converted price "getPrice".
    function getConversionRate(uint256 _ethAmount) internal view returns (uint256)
    {
        // Reference https://docs.chain.link/docs/ethereum-oracle/.
        // 1 ETH
        // 2000_000000000000000000
        // Getting ETH price from chainlink.org by calling the "getPrice" function. 
        uint256 ethPrice = getPrice();

        // (2000_000000000000000000 * 1_000000000000000000) / 1e18
        // $2000 = 1 ETH
        // Get USD price based on the converted ETH price in terms of USD.
        uint256 ethAmountInUsd = (_ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }
}