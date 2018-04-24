pragma solidity ^0.4.19;

import "./ownable.sol";

contract PredictionFactory is Ownable {

  event NewPrediction(uint predictionId, uint dna);

  uint predictionFee = 0.001 ether;

  struct Prediction {
    uint dna;
  }

  Prediction[] public predictions;

  mapping(uint => address) public predictionToOwner;
  mapping(address => uint) ownerPredictionCount;

  function createPrediction(uint _dna) external payable {
    require(msg.value == predictionFee);
    uint id = predictions.push(Prediction(_dna)) -1;
    predictionToOwner[id] = msg.sender;
    ownerpredictionCount[msg.sender]++;
    NewPrediction(id, _dna);
  }

}
