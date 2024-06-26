// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

import {NANI} from "../src/NANI.sol";
import {Test} from "../lib/forge-std/src/Test.sol";

contract NANITest is Test {
    NANI immutable nani = new NANI();
    DummyToken immutable token = new DummyToken();
    address constant DAO = 0xDa000000000000d2885F108500803dfBAaB2f2aA;

    function setUp() public payable {
        // vm.createSelectFork(vm.rpcUrl('main')); // Ethereum mainnet fork.
        // vm.createSelectFork(vm.rpcUrl('arbi')); // Arbitrum EthL2 fork.
    }

    function testCreate() public payable {
        new NANI();
    }

    function testSet() public payable {
        vm.prank(DAO);
        bytes4 selector = bytes4(keccak256("transfer(address,uint256)"));
        nani.set(selector, address(token));
        assertEq(nani.get(selector), address(token));
    }

    function testExecutor() public payable {
        vm.prank(DAO);
        bytes4 selector = bytes4(keccak256("transfer(address,uint256)"));
        nani.set(selector, address(token));
        assertEq(nani.get(selector), address(token));
        vm.prank(DAO);
        bytes4 selector2 = bytes4(keccak256("balanceOf(address)"));
        nani.set(selector2, address(token));
        assertEq(nani.get(selector2), address(token));
        (bool s,) = address(nani).call(abi.encodeCall(DummyToken.transfer, (address(1), 1 ether)));
        assert(s);
        (, bytes memory retData) =
            address(nani).staticcall(abi.encodeWithSelector(selector2, (address(1))));
        uint256 balance = abi.decode(retData, (uint256));
        assertEq(1 ether, balance);
    }

    function testReceive() public payable {
        assertEq(address(nani).balance, 0);
        payable(address(nani)).transfer(1 ether);
        assertEq(address(nani).balance, 1 ether);
    }
}

contract DummyToken {
    mapping(address => uint256) public balanceOf;

    function transfer(address to, uint256 amount) public payable returns (bool) {
        balanceOf[to] += amount;
    }
}
