<img src="https://user-images.githubusercontent.com/85468864/217445684-125f0495-6f45-4c2d-b7ac-ed25a28477af.png" width="100%">

# Aptos-kotlin
https://github.com/cosmostation/aptos-kotlin

# Overview
This is an Aptos SDK that anyone can develop a wallet. It contributes to lowering entry barriers and vitalizing communities and networks. The quickest and easiest way to interact with Aptos!

# Features
This repository contains core functionality needed to create Aptos Wallet.
1. Anyone can create a wallet easily and quickly.
2. It can be customized as the user wants.
3. Lower entry barriers to wallet development.

# Requirements
* ios 13
* Swift

## Dependency

#### Swift Package Manager

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `aptos-swift` by adding the proper description to your `Package.swift` file:
```swift
dependencies: [
    .package(url: "https://github.com/cosmostation/aptos-swift.git", .branch("main"))
]
```

#### CocoaPods

You can use [CocoaPods](http://cocoapods.org/) to install `aptos-swift` by adding it to your `Podfile`:

```ruby
platform :ios, '13.0'
use_frameworks!

target 'MyApp' do
    pod 'aptos-swift'
end
```

## API
Using api like below.
```swift
AptosClient.shared.{API}
```

### Generate new mnemonic
```swift
public func generateMnemonic() -> String?
```

### Get address from mnemonic
```swift
public func getAddress(_ mnemonic: String)  -> String
```

### Sign data
```swift
public func sign(_ mnemonic: String, _ txBytes: Data) -> (pubKey: Data, signedData: Data)
```

### Get account
```swift
public func getAccount(address: String) 
```

### Get accountResources
```swift
public func getAccountResources(address: String) 
```

### Get account transactions
```swift
public func getAccountTransactions(address: String) 
```

### Encode submission
```swift
public func encodeTransaction(encodeRequestMessage: EncodeRequest)
```

### Submit transaction
```swift
public func submitTransaction(submitRequestMessage: SubmitRequest) 
```
