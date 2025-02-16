//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "script/DeployOurToken.s.sol";

contract OutTokenTest is Test {
    OurToken public ot;
    DeployOurToken public dot;

    address sender = makeAddr("SENDER");
    address receiver = makeAddr("RECEIVER");

    function setUp() public {
        dot = new DeployOurToken();
        ot = dot.run();

        vm.prank(msg.sender);
        ot.transfer(sender, 100 ether);
    }

    function testSenderBalance() public view {
        assertEq(ot.balanceOf(sender), 100 ether);
    }

    function testAllowance() public {
        //sender approves receiver to spend 1000 tokens
        uint256 initialAllowance = 1000;
        vm.prank(sender);
        ot.approve(receiver, initialAllowance);

        uint256 transferAmount = 100;
        vm.prank(receiver);
        ot.transferFrom(sender, receiver, transferAmount);

        assertEq(ot.balanceOf(sender), 100 ether - transferAmount);
        assertEq(ot.balanceOf(receiver), transferAmount);
    }

    function testTransfer() public {
        uint256 transferAmount = 100;
        vm.prank(sender);
        ot.transfer(receiver, transferAmount);

        assertEq(ot.balanceOf(sender), 100 ether - transferAmount);
        assertEq(ot.balanceOf(receiver), transferAmount);
    }
}
