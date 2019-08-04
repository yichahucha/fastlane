fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios set_build_number
```
fastlane ios set_build_number
```
set build number
### ios beta
```
fastlane ios beta
```
build a test ipa
### ios release
```
fastlane ios release
```
build a release ipa
### ios ijiami
```
fastlane ios ijiami
```
build a ijiami ipa
### ios submit_review
```
fastlane ios submit_review
```
upload binary to iTC

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
