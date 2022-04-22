import { BigNumber } from "@ethersproject/bignumber";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { Contract } from "hardhat/internal/hardhat-network/stack-traces/model";
import { Sample } from "../typechain";

describe("Sample", function () {
  let deployer: SignerWithAddress, user1: SignerWithAddress, user2: SignerWithAddress, addrs;
  let sample: Sample;
  before(async () => {
    [deployer, user1, user2, ...addrs] = await ethers.getSigners()
    const Sample = await ethers.getContractFactory("Sample");
    sample = await Sample.deploy();
    await sample.deployed();
  })
  it("Should return the new greeting once it's changed", async function () {
    expect(await sample.balances(deployer.address)).to.equal(100);
  });

  it("mint success", async () => {
    await sample.mint(50, user1.address);

    expect(await sample.balances(user1.address)).to.eq(50);
  })

  it('not owner try to mint', async () => {
    await expect(sample.connect(user1).mint(50, user1.address)).to.revertedWith('invalid owner')
  })

  it('Transfer success', async () => {
    let balance1 = await sample.balances(user1.address)
    let balance2 = await sample.balances(user2.address)
    await sample.transfer(10, user1.address, user2.address);

    expect(await sample.balances(user1.address)).to.eq(balance1.add(10))
    expect(await sample.balances(user2.address)).to.eq(balance2.add(10))
  })
});
