var Web3 = require('web3')
var web3 = new Web3(new Web3.providers.HttpProvider("https://testnet-rpc.gochain.io"));
module.exports = web3;

var Factory = artifacts.require("./contracts/Factory.sol");

module.exports = function(deployer) {
	deployer.deploy(Factory);
};


