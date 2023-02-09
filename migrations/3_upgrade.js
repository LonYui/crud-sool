//後續擴充合約(3_deploy_CRUDV2.js)
const { upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const CRUD = artifacts.require('CRUD');
// const CRUDV2 = artifacts.require('CRUDV2');

module.exports = async function (deployer) {
    // const existing = await CRUD.deployed();
    // await upgradeProxy(existing.address, CRUDV2, { deployer } );
    await upgradeProxy("0xFE54C57E0a857c2C111373dF8E5f79566CAF3A63", CRUD, { deployer } );
};