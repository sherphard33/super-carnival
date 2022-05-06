//SPDX-License-Identifier: UNLICENSED
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.4;
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract RoboPunk is ERC721, Ownable {
    uint256 public mintPrice;
    uint256 public totalSupply;
    uint256 public maxSupply;
    uint256 public maxPerWallet;
    bool public isPublicMintEnabled;
    string internal baseTokenUri;
    address payable public withdrawWallet;
    mappping(address => uint256) public walletMints;

    constructor() payable ERC721('RoboPunk', 'RP'){
        mintPrice = 0.02 ether;
        totalSupply = 0;
        maxSupply = 1000;
        maxPerWallet = 3;
    }

    function setIsPublicMintEnabled(bool isPublicMintEnabled_)  external onlyOwner{
        isPublicMintEnabled = isPublicMintEnabled_;
        
    }

    function setBaseTokenUri(string calldata baseTokenUri_) etrenal onlyOwner{
        baseTokenUri = baseTokenUri_;
    }

    function tokenURI(uint256 tokenId_) public view override return (string memory) {
        require(_exists(tokenId_), 'Token does not exist!');
        return string(abi.encodePacked(baseTokenUri, Stringd.toString(tokenId_), ".json"));
    }

    function withdraw() external onlyOwner {
        (bool success, ) = withdrawWallet.call{ value: address(this).balance }('');
        require(success, 'withdarw failed')
    }
}
