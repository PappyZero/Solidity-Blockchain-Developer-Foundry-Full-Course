// Declaring the License and Stating the solidity version
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleStorage
{
    // variable favouriteNumber gets initialized to 0 if no value is given.
    uint256 myFavouriteNumber;

    // uint256[] listOfFavoouriteNumbers;

    // Creating a custom data type using "struct".
    struct Person
    {
        uint256 favouriteNumber;
        string name;
    }

    // Using the custom datatype to declare an empty array. 
    Person[] public listOfPeople;

    // Mapping the name of the person to the favouriteNumber. 
    mapping(string => uint256) public nameToFavouriteNumber;

    // Creating a function to store the favouriteNumber inputted.
    function store(uint256 _favouriteNumber) public virtual 
    {
        myFavouriteNumber = _favouriteNumber;
    }

    // Creating a function to retrieve and show the favouriteNumber stored. 
    function retrieve() public view returns (uint256)
    {
        return myFavouriteNumber;
    }

    // Creating a function to add a Person to the array listOfPeople and mapping the _favouriteNumber inputted to the map "nameToFavouriteNumber". 
    function addPerson(string memory _name, uint256 _favouriteNumber) public 
    {
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

}

contract SimpleStorage2
{

}

contract SimpleStorage3
{

}

contract SimpleStorage4
{

}

contract SimpleStorage5
{

}
