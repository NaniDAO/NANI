# NANI
[Git Source](https://github.com/NaniDAO/-/blob/37c118f77a0de6a544a6d0de55981d7b5ae0d72f/src/NANI.sol)


## State Variables
### DAO

```solidity
address constant DAO = 0xDa000000000000d2885F108500803dfBAaB2f2aA;
```


## Functions
### get


```solidity
function get(bytes4 selector) public view returns (address executor);
```

### set


```solidity
function set(bytes4 selector, address executor) public payable;
```

### fallback


```solidity
fallback() external payable;
```

