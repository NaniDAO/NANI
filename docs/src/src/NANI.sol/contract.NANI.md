# NANI
[Git Source](https://github.com/NaniDAO/-/blob/1a809b31ff34db54e45a2c4ecc87dbae0f217807/src/NANI.sol)


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

