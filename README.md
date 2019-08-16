<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2018-09-08 11:40:23
 * @LastEditTime: 2019-08-16 10:36:51
 * @LastEditors: Please set LastEditors
 -->
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
build number
### ios beta
```
fastlane ios beta
```
build a beta ipa
### ios betaijm
```
fastlane ios betaijm
```
build a ijiami beta ipa
### ios release
```
fastlane ios release
```
build a release ipa
### ios releaseijm
```
fastlane ios releaseijm
```
build a ijiami release ipa
### ios submit_review
```
fastlane ios submit_review
```
upload binary to iTC (and maybe submit review)

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
