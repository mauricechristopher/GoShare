pragma solidity ^0.4.24;

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface { //  standard interface for ERC20 tokens
    function totalSupply() public view returns (uint); // returns total supply
    function balanceOf(address tokenOwner) public view returns (uint balance); // returns balance of token Owner  
    function allowance(address tokenOwner, address spender) public view returns (uint remaining); // returns remaining number of tokens on an owner address
    function transfer(address to, uint tokens) public returns (bool success); // transfer tokens to a new address
    function approve(address spender, uint tokens) public returns (bool success); // function to approve spemding 
    function transferFrom(address from, address to, uint tokens) public returns (bool success); 

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// ----------------------------------------------------------------------------
// Safe Math
// ----------------------------------------------------------------------------
contract SafeMath { // safeguards the way variables are added, extracted, multiplied and divided
    function safeAdd(uint a, uint b) public pure returns (uint c) { // add
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint a, uint b) public pure returns (uint c) { // extract
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint a, uint b) public pure returns (uint c) { // multiply
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint a, uint b) public pure returns (uint c) { // divide
        require(b > 0);
        c = a / b;
    }
}

contract Factory {

    address owner;

    mapping(address => address) Contracts;
    //address[] public allContracts;

    function createChildContract(string _ctName, string _username) public payable {
      // insert check if the sent ether is enough to cover the car asset ...
        address _ctOwner = msg.sender;
        
        address newRaisee = new Raisee(_ctOwner, _ctName, _username);
        Contracts[msg.sender] = (newRaisee);

        
    }
    function getDeployedChildContracts(address _address) public view returns (address) {
        return Contracts[_address];
    }
}
contract Raisee {
    address ctOwner;
    string ctName;
    string username;

    constructor(address _ctOwner, string _ctName, string _username) public payable {
        // Needs isOwner Function
        ctOwner = _ctOwner;
        ctName = _ctName;
        username = _username;
    }

    mapping(address => uint) Sharees;

    function viewContract() public view returns(address, string, string) {
        return(ctOwner, ctName, username);
    }

}