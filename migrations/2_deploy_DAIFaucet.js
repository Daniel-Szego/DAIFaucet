const DAIFaucet = artifacts.require("DAIFaucet");

const uniswapV2AddressKovan = "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";
const daiAddressKovan = "0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa";

module.exports = async function(deployer, network) {

    await deployer.deploy(DAIFaucet, uniswapV2AddressKovan, daiAddressKovan);
 
}  