import { ethers } from "hardhat";

async function main() {

  const conditionalTransfer = await ethers.deployContract("ConditionalTransfer");

  await conditionalTransfer.waitForDeployment();

  console.log("ConditionalTransfer deployed to : ",await conditionalTransfer.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
