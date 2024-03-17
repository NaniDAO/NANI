// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.25;
å
contract NANI {
    address constant DAO = 0xDa000000000000d2885F108500803dfBAaB2f2aA;

    function get(bytes4 selector) public view returns (address executor) {
        assembly ("memory-safe") {
            executor := sload(selector)
        }
    }

    function set(bytes4 selector, address executor) public payable {
        assembly ("memory-safe") {
            if iszero(eq(caller(), DAO)) { revert(codesize(), 0x00) }
            sstore(selector, executor)
        }
    }

    fallback() external payable {
        assembly ("memory-safe") {
            if iszero(calldatasize()) { return(codesize(), 0x00) } // `receive()`.
            calldatacopy(0x00, 0x00, calldatasize())
            if iszero(
                delegatecall(
                    gas(),
                    /*executor*/
                    sload( /*selector*/ shl(224, shr(224, calldataload(0)))),
                    0x00,
                    calldatasize(),
                    codesize(),
                    0x00
                )
            ) {
                returndatacopy(0x00, 0x00, returndatasize())
                revert(0x00, returndatasize())
            }
            returndatacopy(0x00, 0x00, returndatasize())
            return(0x00, returndatasize())
        }
    }
}
