# dreidel

This is demo of dreidel on the blockchain.

## Contracts 

* There are two contracts an ERC20 token contract and the dridel contract

## Functions

* ERC20 standard functions
    * mint function with an only owner modifier

* Dreidel
    * a constructor that requires the ERC20 token
    * ```result()``` internal function for generating a pseudo random number, mimicing a dridiel spin. Result can be a 0 1 2 or 3 
    * ```play()``` 
        * this is the game, get the dridel spin 
        * requires an anti
        * 0 = gimal win whole pot (will transfer all the balance )
        * 1 = Hey,half the pot will transfer half the balance of the pot
        * 2 = shin, repay your anti
        * 3 == noon no payout

## Flow

* User must have the tokens first then aprove the contract to spend on its behalf,

* Then user just needs to call spin
    

## Run Locally

* ``` yarn install```

* ```yarn run ganache-cli```

* ``` yarn run truffle test ```
