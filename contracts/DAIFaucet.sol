pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DAIFaucet {

    /// STATE VARIABLES
    address public uniswapV2RouterAddress;
    address public daiAddress;
    IUniswapV2Router02 public uniswapRouter;


    /// CONSTRUCTOR
    constructor(address _uniswapV2RouterAddress, address _daiAddress) public {
        uniswapV2RouterAddress = _uniswapV2RouterAddress;
        daiAddress = _daiAddress;
        uniswapRouter = IUniswapV2Router02(_uniswapV2RouterAddress);
    }

    /// TRANSACTIONS
    function swapETHtoDAI() internal {
        
        uint deadline = now + 0; // direct settlement

        // getting path between ETH and DAI
        address[] memory path = new address[](2);
        path[0] = uniswapRouter.WETH();
        path[1] = daiAddress;

        uniswapRouter.swapExactETHForTokens.value(msg.value)(
            0, 
            path, 
            msg.sender, 
            deadline);

            // refund leftover ETH to user
        msg.sender.call.value(msg.sender.balance)("");

    }

    /// @notice Fallback function: default deposit
    /// @dev ...
    fallback() external payable {
        swapETHtoDAI();
    }
}
