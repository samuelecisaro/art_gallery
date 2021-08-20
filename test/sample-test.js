const { expect } = require("chai");

const json = {
  "name": "Bike",
  "description": "Really cool bike.",
  "image": "https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
};

describe("ArtWork", function () {
  it("Should create new item", async function () {

    const [owner] = await ethers.getSigners();

    const ArtWork = await ethers.getContractFactory("Artwork");
    const artwork = await ArtWork.deploy();
    await artwork.deployed();

    await artwork.createNewItem(json, owner.address);

    expect(await artwork.getTokenCounter()).to.equal(1);
  });
});
