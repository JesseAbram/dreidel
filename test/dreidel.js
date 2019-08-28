const token = artifacts.require('ExampleToken')
const dreidel = artifacts.require('dreidel')

contract('stable', async accounts => {
  const mainAccount = accounts[0]
  const name = 'test'//process.env.TOKEN_NAME
  const symbol = 'tst'//process.env.TOKEN_SYMBOL
  const decimals = 18//parseInt(process.env.TOKEN_DECIMALS)
  let amountToMint = web3.utils.toBN(10)
  let dreidelInstance;
  let tokenInstance;

  beforeEach(async function () {
    tokenInstance = await token.new(name, symbol, decimals)
    dreidelInstance = await dreidel.new(tokenInstance.address)
    await tokenInstance.mint(mainAccount, amountToMint)
  })

  it('should play the game and do a proper payout', async function () {
     await tokenInstance.approve(dreidelInstance.address, 100)
     await dreidelInstance.play()
     const spinResult = await dreidelInstance.getSpin()
     const balance = await tokenInstance.balanceOf(dreidelInstance.address)
     
     if (spinResult == 0) {
         assert.deepEqual(balance, web3.utils.toBN(0))
     }
     if (spinResult == 1) {
        assert.deepEqual(balance, web3.utils.toBN(1))
     }
     if (spinResult == 2) {
        assert.deepEqual(balance, web3.utils.toBN(4))
     }
     if (spinResult == 3) {
        assert.deepEqual(balance, web3.utils.toBN(2))
     }
  })

})