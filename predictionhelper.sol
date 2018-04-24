pragma solidity ^0.4.19;

import "./predictionfactory.sol";

contract PredictionHelper is PredictionFactory {

  string public _finalResult;

  function withdraw() external onlyOwner {
    owner.transfer(0.1 * this.balance);
  }

  function setFinalResult(string _dna) external onlyOwner {
    _finalResult = _dna;
  }

  function setPredictionFee(uint _fee) external onlyOwner {
    minPredictionFee = _fee;
  }
}
