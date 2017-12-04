pragma solidity ^0.4.11;

import "./CryptoRuble.sol";

contract CryptoRublePreSale {
    CryptoRuble public token;
    address public beneficiary;
    address public alfatokenteam;
    
    uint public amountRaised;
    
    uint public bonus;
    uint public price;    
    uint public minSaleAmount;

    function CryptoRublePreSale(
        CryptoRuble _token,
        address _beneficiary,
        address _alfatokenteam
    ) {
        token = CryptoRuble(_token);
        beneficiary = _beneficiary;
        alfatokenteam = _alfatokenteam;
        bonus = 30;
        price = 50;
        minSaleAmount = 50000000000000000000;
    }

    function () payable {
        uint amount = msg.value;
        uint tokenAmount = amount * price;
        if (tokenAmount < minSaleAmount) throw;
        amountRaised += amount;
        token.transfer(msg.sender, tokenAmount * (100 + bonus) / 100);
    }

    function TransferETH(address _to, uint _amount) {
        require(msg.sender == beneficiary || msg.sender == alfatokenteam);
        _to.transfer(_amount);
    }

    function TransferTokens(address _to, uint _amount) {
        require(msg.sender == beneficiary || msg.sender == alfatokenteam);
        token.transfer(_to, _amount);
    }

    function ChangeBonus(uint _bonus) {
        require(msg.sender == beneficiary || msg.sender == alfatokenteam);
        bonus = _bonus;
    }
    
    function ChangePrice(uint _price) {
        require(msg.sender == beneficiary || msg.sender == alfatokenteam);
        price = _price;
    }
    
    function ChangeMinSaleAmount(uint _minSaleAmount) {
        require(msg.sender == beneficiary || msg.sender == alfatokenteam);
        minSaleAmount = _minSaleAmount;
    }
}
