[![Build Status](https://travis-ci.com/jbdtky/github-api-sdk.svg?branch=master)](https://travis-ci.com/jbdtky/github-api-sdk)
[![codecov](https://codecov.io/gh/jbdtky/github-api-sdk/branch/master/graph/badge.svg)](https://codecov.io/gh/jbdtky/github-api-sdk)
![Platform](https://img.shields.io/badge/platform-ios-black.svg) 
![Compatibility](https://img.shields.io/badge/iOS-+8.0-orange.svg) 
![Compatibility](https://img.shields.io/badge/Swift-5.0-orange.svg) 
![License](https://img.shields.io/badge/License-Apache_2.0-lightgrey.svg) 

# Github API SDK
Search Github repositories by platform and organization.

This project is mainly inspired from [this project](https://github.com/jbdtky/github-api-ios)

## Installation

### CocoaPods

#### Podfile

```ruby
target 'DemoApp' do
  pod 'GithubAPISDK', :git => 'https://github.com/jbdtky/github-api-sdk.git'
end
```
#### Commands

```bash
$ pod install
```

## Usage

There is 2 platforms available
- `.ios`
- `.android`

```swift
let instance = GithubAPISDK(
        DefaultAPIProvider(
            maximumSimultaneously: 10,
            queue: DispatchQueue.global(qos: .utility)))

instance.fetchRepositories(.ios, organization: "myorg") { result in
    switch result {
    case let .success(repositories):
        print(repositories)
    case let .failure(error):
        print(error)
    }
}
```

You can implement your own API provider using the protocol `APIProviderProtocol` and provide it to the SDK during the `initialization`. So it allows you to use your favorite framework like Moya, Alamofire or APIKit.

## Contribution

Please feel free to submit a PR for any contribution.