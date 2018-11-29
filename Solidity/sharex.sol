pragma solidity ^0.4.25;

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface { //  standard interface for ERC20 tokens
    function totalSupply() public constant returns (uint); // returns total supply
    function balanceOf(address tokenOwner) public constant returns (uint balance); // returns balance of token Owner  
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining); // returns remaining number of tokens on an owner address
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

