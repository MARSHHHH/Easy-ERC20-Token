//SPDX-License-Identifier: MIT
//testing
pragma solidity ^0.8.18;
/* Creating ERC20 token using OpenZeppelin Library */

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initialSupply);
    }
}
