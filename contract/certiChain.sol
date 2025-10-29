// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CertiChain - Simple Certificate Verification Smart Contract
 * @dev Only the contract owner can issue certificates.
 *      Anyone can verify certificates by their unique hash.
 */
contract CertiChain {
    // Owner of the contract (e.g., university or certification body)
    address public owner;

    // Struct to represent a certificate
    struct Certificate {
        string name;         // Name of the certificate holder
        string issuer;       // Issuing organization
        uint256 issueDate;   // Timestamp when issued
        bool isValid;        // Certificate validity status
    }

    // Mapping from certificate hash => certificate details
    mapping(bytes32 => Certificate) public certificates;

    // Event emitted when a new certificate is issued
    event CertificateIssued(bytes32 indexed certHash, string name, string issuer);

    // Modifier to restrict functions to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can do this");
        _;
    }

    // Constructor sets the deployer as the contract owner
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Issue a new certificate (only owner can do this)
     * @param _certHash Unique hash of the certificate file (e.g., SHA256)
     * @param _name Name of the certificate holder
     * @param _issuer Name of the issuing organization
     */
    function issueCertificate(bytes32 _certHash, string memory _name, string memory _issuer) public onlyOwner {
        require(!certificates[_certHash].isValid, "Certificate already exists");

        certificates[_certHash] = Certificate({
            name: _name,
            issuer: _issuer,
            issueDate: block.timestamp,
            isValid: true
        });

        emit CertificateIssued(_certHash, _name, _issuer);
    }

    /**
     * @dev Verify a certificate using its hash
     * @param _certHash Certificate hash
     * @return name Name of the holder, issuer, issue date, and validity
     */
    function verifyCertificate(bytes32 _certHash) public view returns (string memory name, string memory issuer, uint256 issueDate, bool isValid) {
        Certificate memory cert = certificates[_certHash];
        return (cert.name, cert.issuer, cert.issueDate, cert.isValid);
    }

    /**
     * @dev Invalidate a certificate (e.g., revoked or expired)
     * @param _certHash Hash of the certificate
     */
    function revokeCertificate(bytes32 _certHash) public onlyOwner {
        require(certificates[_certHash].isValid, "Certificate does not exist or already invalid");
        certificates[_certHash].isValid = false;
    }
}

