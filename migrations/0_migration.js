const MyToken=artifacts.require('../contracts/MyToken.sol');
module.exports=function(deployer)
{
        return deployer.deploy(MyToken);
};
