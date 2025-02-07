// Declaring the License Identifier and Stating the version of solidity. 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Importing the SimpleStorage Contract. 
// import "./SimpleStorage.sol";

// Using "named imports" to specifically import the SimpleStorage contract only from the "SimpleStorage.sol" file. 
import {SimpleStorage} from "./SimpleStorage.sol";
// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";


contract StorageFactory
{
    // Creating a stage variable "simpleStorage" that will store the contract. 
    // SimpleStorage public simpleStorage;
    SimpleStorage[] public listOfSimpleStorage;

    // Creating a function that will create a new simple storage contract. 
    function createSimpleStorageContract() public 
    {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorage.push(newSimpleStorageContract);
    }

    // To call the store function in the imported contract. 
    // To interact with a contract, you need the "Address" and "ABI - Application Binary Interface".

    // Create a function to use the store function from the imported contract to store a number to one of the new simple storage contracts.
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public 
    {
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    // Creating a function to use the retrieve function from the imported contract to read/view the stored number from one of the new simple storage contracts.
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256)
    {
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }


} 