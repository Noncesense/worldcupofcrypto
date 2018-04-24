pragma solidity ^0.4.19;

import "./predictionfactory.sol";

contract PredictionHelper is PredictionFactory {

  function withdraw() external onlyOwner {
    owner.transfer(0.1 * this.balance);
  }

}
