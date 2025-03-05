// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.5.0;

interface VendorToken {
    ///
    /// @param addr the address to check
    /// @return the balance of the address
    function getBalanceAddress(address addr) external view returns (uint256);

    ///
    /// @param amount the amount to send
    /// @param receiver the address to send to
    /// @return true if the transfer was successful
    function sendTo(uint amount, address receiver) external returns (bool);

    function withdraw(uint amount, address receiver) external returns (bool);

    function mint(uint amount) external returns (bool);

    function burn(uint amount) external returns (bool);

    function deposit(uint amount) external returns (bool);
}
