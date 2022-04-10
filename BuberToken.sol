SPDX-License-Indifier:MIT
pragma solidity^0.8.11;

contract BuberToken{
    mapping(address => uint) public balances ;
    string public name = "BuberToken";
    string public symbol = "BT";
    uint public totalSupply = 21000000 * 10 ** 18;
    uint public decimals = 18;

    event Transfer (address indexed from, address indexed to, uint value);
    event Approval (address indexed owner, address indexed spender, uint value);
    constructor () {
        balances[msg.sender] = totalSupply;
    }

    function balancesOf (address owner) public view returns(uint) {
        return balances[owner];
    }

    function transferFrom(address from, address to, uint value ) public returns(bool) {
        require(balancesOf(from)>= value, 'Too less balance');
        require(allowence [from] [msg.sender] >= value, 'Allowence is to low');
        balances[to]+= value;
        balances[from] -= value;
        emit Transfer(from, to , value);
        return true;
    }

    function transferToken(address to uint value) public returns (bool) {
        require(balances(msg.sender)>= value, 'Value too big');
        balances[to] = balances[to] + value;  // the same like: balances[to] += value
        balances[msg.sender] = balances[msg.sender] - value; //  the same like: balances[msg.sender] -= value
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve (address spender uint value) public returns(bool) {
        allowence[msg.sender] [spender] = value;
        emit Approval(msg.sender, spender, uint);
        return(bool);

    }
}
