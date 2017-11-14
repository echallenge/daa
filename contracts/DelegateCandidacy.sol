pragma solidity ^0.4.15;


import './Proposals.sol';


contract DelegateCandidacy is Proposals {

    uint256 private constant VOTE_TIME_IN_MINS = 10;

    function proposeDelegateCandidacy() public onlyMember {
        super.submitProposal(DELEGATE_CANDIDACY, "Propose Delegate Candidacy",
            0, address(0), VOTE_TIME_IN_MINS.mul(1 minutes));
    }

    function voteForDelegate(uint256 proposalId, bool favor) public onlyMember {
        super.voteForProposal(DELEGATE_CANDIDACY, proposalId, favor);
    }

    function concludeProposal(uint256 proposalId) internal {
        concludeVoteForDelegate(proposalId);
    }

    function concludeVoteForDelegate(uint256 proposalId) private {
        // TODO: Candidate with most votes in favor is new candidate
        // If 2 or more candidates have same and most number of votes, re-vote on only those

    }
}