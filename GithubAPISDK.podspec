#
#  Be sure to run `pod spec lint SLPWallet.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "GithubAPISDK"
  s.version      = "1.0.0"
  s.summary      = "Github API SDK for iOS"
  s.description  = "Github API SDK for iOS"

  s.homepage     = "https://github.com/jbdtky/github-api-sdk"
  
  s.license      = { :type => "Apache2.0", :file => "LICENSE" }

  s.author             = { "jbdtky" => "jeanbaptiste.dominguez@gmail.com" }

  s.swift_version = "5.0"
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/jbdtky/github-api-sdk.git", :branch => "v#{s.version}" }
  s.source_files  = "GithubAPISDK/**/*.swift"

end
