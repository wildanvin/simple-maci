// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

import '@anon-aadhaar/contracts/interfaces/IAnonAadhaar.sol';

contract Test {
   
    address public anonAadhaarVerifierAddr;

    constructor(
        address _verifierAddr
    ) {
        anonAadhaarVerifierAddr = _verifierAddr;
    }

    function verifiedAadhaar2(
							uint _nullifierSeed, 
							uint _nullifier, 
							uint _timestamp, 
							uint _signal, 
							uint[4] memory _revealArray, 
							uint[8] memory _groth16Proof
							) public view returns (bool) {
		bool verified = IAnonAadhaar(anonAadhaarVerifierAddr).verifyAnonAadhaarProof(
                _nullifierSeed, // nulifier seed
                _nullifier,
                _timestamp,
                _signal,
                _revealArray,
                _groth16Proof
            );
	
		return verified;
	}
}