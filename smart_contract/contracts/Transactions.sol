// SPDX-License-Identifier: UNLICENSED
// choose the version
pragma solidity ^0.8.0;

// create our contract
contract Transactions {
    // declare a variable to store the number of transactions
    uint256 transactionCount;

    // like a method for the constructor
    event Transfer(
        address from,
        address receiver,
        uint256 amount,
        string message,
        uint256 timestamp,
        string keyword
    );

    // like a object with the properties
    struct TransferStruct {
        address sender;
        address receiver;
        uint256 amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    // create an array of transfer structs
    TransferStruct[] transactions;

    // Create different functions

    // add to the blockchain function public
    function addToBlockchain(
        address payable receiver,
        uint256 amount,
        string memory message,
        string memory keyword
    ) public {
        transactionCount += 1;
        transactions.push(
            TransferStruct(
                // msg is always in the context of the current transaction
                msg.sender,
                receiver,
                amount,
                message,
                block.timestamp,
                keyword
            )
        );

        // so far there is no transaction, to it happen we have to emit the transfer event
        emit Transfer(
            msg.sender,
            receiver,
            amount,
            message,
            block.timestamp,
            keyword
        );
    }

    // get all transactions witn return type of TransferStruct
    function getAllTransactions()
        public
        view
        returns (TransferStruct[] memory)
    {
        return transactions;
    }

    // get the transactionscount with return type of uint256
    function getTransactionsCount() public view returns (uint256) {
        return transactionCount;
    }
}
