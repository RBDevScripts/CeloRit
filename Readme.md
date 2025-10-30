<img width="1333" height="669" alt="image" src="https://github.com/user-attachments/assets/9398ec03-8a2f-4a03-94d7-64337e48cbfc" />


# 🧾 CertiChain - Blockchain Certificate Verification

A simple, transparent, and tamper-proof way to issue and verify digital certificates using blockchain technology.

---

## 📘 Project Description

**CertiChain** is a Solidity-based smart contract designed for organizations (like universities, training centers, or certification bodies) that want to issue **verifiable digital certificates** on the blockchain.  
It ensures that certificates are **authentic**, **immutable**, and **easy to verify** by anyone — without relying on centralized systems.

---

## 🚀 What It Does

- The **owner (issuer)** can issue new certificates linked to a unique hash (e.g., SHA256 of the certificate file).  
- **Anyone** can verify the authenticity of a certificate by its hash.  
- Certificates can also be **revoked** if they expire or are invalidated.

This creates a trustless system where no central authority is needed to verify certificate legitimacy.

---

## ✨ Features

✅ **Owner-controlled issuance** — Only the smart contract owner can issue or revoke certificates.  
🔍 **Public verification** — Anyone can verify certificate details using the hash.  
⛓️ **Blockchain-secured** — Certificate records are stored immutably on the blockchain.  
🕒 **Timestamped issuance** — Each certificate is time-stamped when created.  
🚫 **Revocation support** — Certificates can be marked invalid when revoked.

---

## 📄 Smart Contract Details

**Language:** Solidity `^0.8.20`  
**Framework:** Remix / Hardhat compatible  
**Network:** Celo Sepolia Testnet  
**Deployed Transaction or Contract Address:** [View on Celo Explorer](https://celo-sepolia.blockscout.com/tx/0xdaf3a6b81f5166168379abaa90ddaf7aa6063792dd2d4a0291dc4f3de71a85c8)  

