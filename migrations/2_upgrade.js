//後續擴充合約(3_deploy_CRUDV2.js)
const { upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const CRUD = artifacts.require('CRUD');
// const CRUDV2 = artifacts.require('CRUDV2');

module.exports = async function (deployer) {
    // const existing = await CRUD.deployed();
    // await upgradeProxy(existing.address, CRUDV2, { deployer } );
    await upgradeProxy("0x0CC3bF148Be8f776904E1f539552d55C0b5AA983", CRUD, { deployer } );
};