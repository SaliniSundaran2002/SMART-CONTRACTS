// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Auction {
    address public owner;
    uint256 public highestBid;
    address public highestBidder;

    mapping(address => uint256) public bids;

    bool public auctionEnded;

    constructor() {
        owner = msg.sender; // Set the auction owner
    }

    // Modifier to restrict certain actions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    // Function to place a bid
    function placeBid() public payable {
        require(!auctionEnded, "Auction has ended");
        require(msg.value > highestBid, "Bid is too low");

        // Refund the previous highest bidder
        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid; // Add back the previous highest bid to their balance
        }

        // Update the highest bid and bidder
        highestBid = msg.value;
        highestBidder = msg.sender;

        // Record the bid
        bids[msg.sender] += msg.value;
    }

    // Function to end the auction
    function endAuction() public onlyOwner {
        require(!auctionEnded, "Auction already ended");
        auctionEnded = true;

        // Transfer the highest bid to the owner
        if (highestBid > 0) {
            payable(owner).transfer(highestBid);
        }
    }

    // Allow participants to withdraw their bids if they lose
    function withdraw() public {
        require(auctionEnded, "Auction is not yet ended");
        require(msg.sender != highestBidder, "Winner cannot withdraw");

        uint256 amount = bids[msg.sender];
        require(amount > 0, "No funds to withdraw");

        bids[msg.sender] = 0; // Prevent re-entrancy
        payable(msg.sender).transfer(amount);
    }
}
