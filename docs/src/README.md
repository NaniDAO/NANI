# [NANI](https://github.com/NaniDAO/NANI)  [![License: AGPL-3.0-only](https://img.shields.io/badge/License-AGPL-black.svg)](https://opensource.org/license/agpl-v3/) [![solidity](https://img.shields.io/badge/solidity-%5E0.8.25-black)](https://docs.soliditylang.org/en/v0.8.25/) [![Foundry](https://img.shields.io/badge/Built%20with-Foundry-000000.svg)](https://getfoundry.sh/) ![tests](https://github.com/NaniDAO/NANI/actions/workflows/ci.yml/badge.svg)

`NANI` dynamic contract for onchain AI. A *function-by-function* approach to building *onchain intelligence* augmented by a [*DAO*](https://arbiscan.io/address/0xDa000000000000d2885F108500803dfBAaB2f2aA#code). By using a single (efficient) create2 address across all blockchains, `NANI` can serve as a single source of truth for agents and DAOs seeking curated onchain data services.

[`0x000000000000641b6a7b74f177babdb4417718ef`](https://arbiscan.io/address/0x000000000000641b6a7b74f177babdb4417718ef#code)

## Extensions

Single-getter contracts. Each provide a function to `NANI` according to their name that returns relevant data.

`Models`: [`0x0000000036020043030089d1196c46e3c4dc064c`](https://arbiscan.io/address/0x0000000036020043030089d1196c46e3c4dc064c#code)

`Prompts`: [`0x0000000000b1cddDFDdf0048BfEF46594B799c1b`](https://arbiscan.io/address/0x0000000000b1cddDFDdf0048BfEF46594B799c1b#code)

### Akashic (Knowledge base)

[`0x000000000000394793B2Fe854281CeE09a98bdBC`](https://arbiscan.io/address/0x000000000000394793B2Fe854281CeE09a98bdBC#code)

## Getting Started

Run: `curl -L https://foundry.paradigm.xyz | bash && source ~/.bashrc && foundryup`

Build the foundry project with `forge build`. Run tests with `forge test`. Measure gas with `forge snapshot`. Format with `forge fmt`.

## Blueprint

```txt
lib
├─ forge-std — https://github.com/foundry-rs/forge-std
├─ solady — https://github.com/Vectorized/solady 
src
├─ NANI — NANI Contract
test
└─ NANI.t - NANI Test Contract
```

## Disclaimer

*These smart contracts and testing suite are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of anything provided herein or through related user interfaces. This repository and related code have not been audited and as such there can be no assurance anything will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk.*

## License

See [LICENSE](./LICENSE) for more details.