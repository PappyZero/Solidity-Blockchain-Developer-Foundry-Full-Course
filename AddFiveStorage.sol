// Declaring the License Identifier and Stating the solidity version used. 
// SPDX-License-Ientifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Using the named imports.
import {SimpleStorage} from "./SimpleStorage.sol";

// Inheriting the contract SimpleStorage as the parent contract amd AddFiveStorage as the child contract.
contract AddFiveStorage is SimpleStorage
{
    string greeting = "hello";
    // Adding a cuntom functionality in the child class contract.
    function sayHello() public view returns (string memory)
    {
        return greeting;
    }

    function sayHello2() public pure returns (string memory)
    {
        return "hello";
    }

    function store(uint256 _newNumber) public override  
    {
        myFavouriteNumber = _newNumber + 5;
    }
}