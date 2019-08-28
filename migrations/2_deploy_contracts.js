const dreidel = artifacts.require("./dreidel.sol");
const ERC20 = artifacts.require("./ERC20.sol");



module.exports = function(deployer) {
    deployer.then(async () => {
      await deployer.deploy(ERC20, 'TEST', 'TST', 18);
      const token = await ERC20.deployed();
      await deployer.deploy(dreidel, token.address);
      
    })
  };
  