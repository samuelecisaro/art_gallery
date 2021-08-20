// contracts/ArtWork.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract Artwork is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721("ARTWORK", "ARW") {}

  function createNewItem(string memory tokenURI, address owner) 
  public 
  returns(uint256)
  {
    _tokenIds.increment();

    uint256 newItemId = _tokenIds.current();
    _mint(owner, newItemId);
    _setTokenURI(newItemId, tokenURI);

    return newItemId;
  }

  function getTokenCounter() 
  public
  view
  returns(uint256)
  {
    return _tokenIds.current();
  }
}