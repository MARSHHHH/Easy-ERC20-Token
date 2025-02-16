//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/* Mannully creating ERC20 token */

contract ManualToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether; //1000000000000000000
    }

    function decimals() public view returns (uint8) {
        return 18; // total supply has 18 decimals
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
