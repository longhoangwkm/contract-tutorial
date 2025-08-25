# SimpleStorage sample

This folder contains a minimal Solidity sample contract for demonstration and testing: `SimpleStorage.sol`.

How to use (with Hardhat):

1. Compile
   - npm install
   - npx hardhat compile

2. Deploy locally (example)
   - Use a simple Hardhat script or deploy from tests. Example interactive:
     npx hardhat run --network localhost scripts/deploy.js

3. Interact
   - Call `store(value)`, `retrieve()`, or `increment()` from tests or scripts.

This sample is intentionally small so it can be used as a starting point for tutorials and unit tests.
