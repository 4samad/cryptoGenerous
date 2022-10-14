// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@klaytn/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@klaytn/contracts/utils/Counters.sol";
import "@klaytn/contracts/access/Ownable.sol";


contract CryptoGenerous is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //Token id => amount
    mapping(uint256 => uint256) public amount;
    

    constructor() ERC721("CryptoGenerous", "CGNR") {
    }

    // Minting New Project to beneficiary
    function mintItem(string memory tokenURI, address to, uint256 _amount)
        public
        returns (uint256)
    {   
        require(msg.sender == owner(), "Only Owner is allowed to mint");
        uint256 newItemId = _tokenIds.current();
        _mint(to, newItemId);
        _setTokenURI(newItemId, tokenURI);
        amount[newItemId] = _amount; //
        _tokenIds.increment();
        return newItemId;
    }

    // Owner can burn a submission for inappropriate or invalid content
    function burnItem(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }

    function totalSubmissions() public view returns (uint256) {
        return _tokenIds.current();
    }

}