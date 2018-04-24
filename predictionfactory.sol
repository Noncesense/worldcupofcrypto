pragma solidity ^0.4.19;

import "./ownable.sol";
import "./safemath.sol";

contract PredictionFactory is Ownable {

  using SafeMath for uint256;
  using SafeMath32 for uint32;
  using SafeMath16 for uint16;

  event NewPrediction(uint predictionId, string dna);

  uint predictionFee = 0.001 ether;

  struct Prediction {
    string dna;
  }

  Prediction[] public predictions;

  mapping(string => address) public predictionToOwner;
  mapping(address => uint) ownerPredictionCount;

  function createPrediction(string _dna) external payable {
    require(msg.value == predictionFee);
    uint id = predictions.push(Prediction(_dna)) -1;
    predictionToOwner[id] = msg.sender;
    ownerpredictionCount[msg.sender] = ownerpredictionCount[msg.sender].add(1);
    NewPrediction(id, _dna);
  }

}
