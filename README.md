# Introduction 

This repo tests if RUST and JS smart contracts can share the same state under the same contract account. The response is NO. The reason is that the two SDKs save data in a different way.

To test that, first we deploy a JS smart contract, change the state and then deploy a RUST smart contract and try to read the state.

## Test procedure

### Install Dependencies

    yarn

### Build both JS and RUST smart contracts

    yarn build

### Deploy JS Smart Contract

Build and deploy your JS contract to TestNet with a temporary dev account:

    yarn deploy:js


### Change the greeting message
near call dev-1667426209688-37311552113285 set_greeting  '{"message": "Hi"}' --accountId ${ACCOUNT_ID}

### View the greeting message
near view dev-1667426209688-37311552113285 get_greeting  


### Deploy RUST Smart Contract

Build and deploy your RURST contract to TestNet on the same dev account:

    yarn deploy:rust

### Try to view the greeting message

near view dev-1667426209688-37311552113285 get_greeting  

The contract will panick due a deserialization bug.

JS and RUST smart contracts cannot share the same states by default due to serialization/deserialization of the contract state by JS contracts.




