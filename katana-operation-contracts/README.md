## Template Smart Contract Project

This repository serves as a template for building robust and efficient smart contracts, providing developers with a structured foundation to accelerate the process of developing, testing and upgrading contracts.

## Documentation

https://book.getfoundry.sh/

## Usage
For a comprehensive guide on writing migrations, refer to [foundry-deployment-kit example](https://github.com/axieinfinity/foundry-deployment-kit/tree/testnet/script/sample).

## Install
```shell
$ yarn install
$ forge install
```

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Simulate

```shell
$ ./run.sh <path/to/file.s.sol> -f <network> 
```

### Broadcast

```shell
$ ./run.sh <path/to/file.s.sol> -f <network> --broadcast --log <subcommand>
```

### Verify

```shell
$ ./verify.sh -c <network>
```

### Debug

#### Debug on-chain transaction hash

```shell
$ cast run -e istanbul -r <network> <tx_hash>
```

#### Debug raw call data

```shell
# Create a debug file
$ touch .debug.env
```
Fill in the necessary variables in the .debug.env file. Refer to the provided .debug.env.example for guidance. Here's an example of how to set the variables:
```shell
BLOCK=21224300
FROM=0x412d4d69122839fccad0180e9358d157c3876f3c
TO=0x512699b52ac2dc2b2ad505d9f29dcdad078fa799
VALUE=0x27cdb0997a65b2de99
CALLDATA=0xcb80fe2f00000000000000000000000000000000000000000000000000000000000000e0000000000000000000000000412d4d69122839fccad0180e9358d157c3876f3c0000000000000000000000000000000000000000000000000000000001e133809923eb94000000032ef4aeab07d3fac5770bd31775496da5b39fa2215aee1494000000000000000000000000803c459dcb8771e5354d1fc567ecc6885a9fd5e600000000000000000000000000000000000000000000000000000000000001200000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000374686900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
``` 
Debug command:
 ```shell
chmod +x debug.sh
./debug.sh -f <network>
``` 

### Miscellaneous

#### Inspect Storage layout

```shell
$ forge inspect <contract> storage-layout --pretty
```

#### Inspect error selectors

```shell
$ forge inspect <contract> errors --pretty
```

#### Decode errors
```shell
$ cast 4byte <error_codes>
# or
$ cast 4byte-decode <long_bytes_error_codes>
```

#### Decode call data
```shell
$ cast pretty-calldata <calldata>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
