// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.5.0;

contract Brams{
    private uint256 _totalSupply;
    private string _name;
    private string _symbol;
    private uint8 _decimals;
    private address owner;
    private mapping(address => uint256) _balances;

    constructor(uint256 totalSupply, string memory symbol, string memory name, uint8 decimals) public {
        _totalSupply = totalSupply;
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        owner = msg.sender;
    }

    public function getBalanceAddress(address addr) view returns (uint256){
        if (addr != owner){
            return _balances[addr]; 
        }
    }
}