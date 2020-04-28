pragma solidity ^0.5.0;

import "./SafeMath.sol";
import "./Constants.sol";
import "./Governable.sol";
import "./Upgradability.sol";


contract AbstractProposal {
    using SafeMath for uint256;

    struct ProposalTimeline {
        uint256 depositingStartTime;
        uint256 depositingEndTime;
        uint256 votingStartTime;
        uint256 votingEndTime;
        uint256 votingStartEpoch;
        uint256 votingEndEpoch;
    }

    uint256 public id;
    uint256 public propType;
    uint256 public status; // status is a bitmask, check out "constants" for a further info
    uint256 public deposit;
    uint256 public requiredDeposit;
    uint256 public permissionsRequired; // might be a bitmask?
    uint256 public minVotesRequired;
    uint256 public totalVotes;
    mapping (uint256 => uint256) public choises;

    ProposalTimeline deadlines;

    string public title;
    string public description;
    string public proposalName;
    bytes public proposalSpecialData;
    bool public votesCanBeCanceled;


    function createSpecialData(bytes32[] calldata dataValues) external returns(bytes32);
    function modifyInnerState(bytes32[] calldata dataValues) external returns(bytes32);
    function validateProposal(bytes32) external;
    function resolveProposal(bytes32) external;
}