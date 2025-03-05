// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.5.0;

contract Brams {
    uint private _balance;
    string private _name;
    string private _symbol;
    address private _owner;

    constructor(string memory name, string memory symbol, uint initialSupply) {
        _name = name;
        _symbol = symbol;
        _balance = initialSupply;
        _owner = msg.sender;
    }

    mapping(address => uint) private _listDepositor;
    mapping(address => uint) private _listWithdrawal;
    mapping(address => mapping(address => uint)) private _listTransfer;
    mapping(address => uint) private _balanceUser;

    /// @param addr the address to check
    /// @return the balance of the address
    function getBalanceAddress(address addr) external view returns (uint256) {
        if (addr == _owner) {
            return _balance;
        }
        return _balanceUser[addr];
    }

    /// @param amount the amount to send
    /// @param receiver the address to send to
    /// @return true if the transfer was successful
    function sendTo(uint amount, address receiver) external returns (bool) {
        require(msg.sender != _owner, "Illegal operation");
        require(
            _balanceUser[msg.sender] >= amount,
            "Brams: insufficient balance"
        );
        _balanceUser[msg.sender] -= amount;
        _balanceUser[receiver] += amount;
        _listTransfer[msg.sender][receiver] += amount;
        return true;
    }

    function withdraw(uint amount) external returns (bool) {
        require(
            _balanceUser[msg.sender] >= amount,
            "Brams: insufficient balance"
        );
        _balanceUser[msg.sender] -= amount;
        _listWithdrawal[msg.sender] += amount;
        burn(amount);
        return true;
    }

    function mint(uint amount) private returns (bool) {
        _balance += amount;
        return true;
    }

    function burn(uint amount) private returns (bool) {
        _balance -= amount;
        return true;
    }

    function deposit(uint amount) external returns (bool) {
        require(msg.sender != _owner, "Illegal operation");
        require(
            _balanceUser[msg.sender] >= amount,
            "Brams: insufficient balance"
        );
        mint(amount);
        _listDepositor[msg.sender] += amount;
        return true;
    }
}
