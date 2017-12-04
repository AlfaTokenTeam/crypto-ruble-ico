pragma solidity ^0.4.12;

import "./lib/BurnableToken.sol";
import "./lib/UpgradeableToken.sol";

contract CryptoRuble is BurnableToken, UpgradeableToken {

  string public name;
  string public symbol;
  uint public decimals;

  function CryptoRuble(address _owner)  UpgradeableToken(_owner) {
    name = "CryptoRuble";
    symbol = "RUB";
    totalSupply = 17075200000000000000000000;
    decimals = 18;

    balances[_owner] = totalSupply;
  }
}