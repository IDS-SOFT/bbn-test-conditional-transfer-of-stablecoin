import { ethers } from "hardhat";

const stablecoin = "0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199"; // Coin addresses
const recipient = "0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199" // Recipient address
const condition = 1;
const amount = 100;

async function main() {

  const conditionalTransfer = await ethers.deployContract("ConditionalTransfer", [stablecoin, recipient, condition, amount] );

  await conditionalTransfer.waitForDeployment();

  console.log("ConditionalTransfer deployed to : ",await conditionalTransfer.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
