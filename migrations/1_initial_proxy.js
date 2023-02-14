//第一份合約(2_deploy_upgradable_contract.js)
const { deployProxy } = require('@openzeppelin/truffle-upgrades');

const CRUD = artifacts.require('CRUD');

module.exports = async function (deployer) {
    // await deployProxy(CRUD, [accounts[0]], { deployer });
    await deployProxy(CRUD, { deployer });
};