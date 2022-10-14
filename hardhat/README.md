# Harhat_Klaytn_Example

This is a simple example for setting up a hardhat project for Klaytn putting in to consideration its fixed gas price model.

Klaytn makes use of a fixed gas price model. This means developers would need to be extra careful when using Ethereum native tooling for they have to set the right amount of gas when creating a transaction. The need to put this into consideration when you are using Ethereum tools on Klaytn is the reason behind this repo. 

This would guide you into how to set up a project, test and deploy it to klaytn putting into consideration the Klaytn compatible gas price using Hardhat and ethers js.

## Installation
1. Clone this repo:

```shell
git clone https://github.com/AyDeveloper/Hardhat_Klaytn_Example.git
```

2. Install NPM packages:

```shell
cd Hardhat_Klaytn_Example
npm install
```
3. Setting Hardhat Config
```shell
  const config: HardhatUserConfig = {
  solidity: "0.8.4",
  networks: {
    klaytn: {
      url: process.env.KLAYTN_URL || "",
      // This is the only field we are including in our file
      gasPrice: 250000000000,
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    },
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};

```

4. : Create a .env file and paste the code below

```shell
   KLAYTN_URL='https://api.baobab.klaytn.net:8651'
  PRIVATE_KEY= your private key copied from kaikas wallet

```

5. Compile Contract

```shell
  npx hardhat compile
```

6. Start Hardhat Node

```shell
  npx hardhat node
```

7. Deployment

```shell
npx hardhat run scripts/deploy.ts --network localhost
```

8. Run tests

```shell
npx hardhat test test/index.ts --network localhost
```


# Other Links
1. How to set up a hardhat project for klaytn https://oxpampam.hashnode.dev/how-to-set-up-a-hardhat-project-for-klaytn
2. Using Ethereum tools in Klaytn https://medium.com/klaytn/using-ethereum-tools-in-klaytn-dc068d48de04
