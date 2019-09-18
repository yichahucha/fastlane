# This file contains the fastlane.tools configuration
# You can find the documentation at https://docs.fastlane.tools
#
# For a list of all available actions, check out
#
#     https://docs.fastlane.tools/actions
#
# For a list of all available plugins, check out
#
#     https://docs.fastlane.tools/plugins/available-plugins
#

# Uncomment the line if you want fastlane to automatically update itself
# update_fastlane
# bundler exec fastlane beta

default_platform(:ios)

platform :ios do

	before_all do
		set_build_number
  	end

	desc "build number"
	lane :set_build_number do
		# 构建版本号更新（自增）
		increment_build_number_in_plist
	end

	# gym 公共参数查看 Gymfile 文件
	desc "build a beta ipa"
	lane :beta do
		gym(
			configuration: "Debug",#Release, Debug
			export_method: "development",#app-store, ad-hoc, development
			output_directory: ENV["beta_folder"],
		)
		# 使用 fir-cli 工具上传
		sh "#{Dir.pwd}/firim.sh"
 	end

 	desc "build a ijiami beta ipa"
	lane :betaijm do
		# 使用爱加密工具链打包 需要指定工具链和配置参数
		gym(
			configuration: "Debug",
			export_method: "development",
			output_directory: ENV["beta_folder"],
			xcargs:"OTHER_CFLAGS='#{ENV["CFLAGS"]}' OTHER_CPLUSPLUSFLAGS='#{ENV["CFLAGS"]}' OTHER_SWIFT_FLAGS='#{ENV["SWIFTFLAG"]}'",
			toolchain:ENV["ijiami_toolchain"]
		)
		# 使用 fir-cli 工具上传
		sh "#{Dir.pwd}/firim.sh"
 	end

	desc "build a release ipa"
	lane :release do
		gym(
			configuration:"Release",
			export_method:"app-store",
			output_directory: ENV["release_folder"]
			)
		# 提交 App Store Connect
		submit_review
	end

	desc "build a ijiami release ipa"
	lane :releaseijm do
		gym(
			configuration:"Release",
			export_method:"app-store",
			output_directory: ENV["ijiami_folder"],
			xcargs:"OTHER_CFLAGS='#{ENV["CFLAGS"]}' OTHER_CPLUSPLUSFLAGS='#{ENV["CFLAGS"]}' OTHER_SWIFT_FLAGS='#{ENV["SWIFTFLAG"]}'",
			toolchain:ENV["ijiami_toolchain"]
			)
		# 提交 App Store Connect
		submit_review
	end

	# deliver 公共参数查看 Deliverfile 文件
	desc "upload binary to iTC (and maybe submit review)"
	lane :submit_review do | options |
		# ipa参数（文件路径）（指定包路径上传iTC: fastlane submit_review ipa:x/x/x.ipa ）
		ipa_path = options[:ipa]
		if ipa_path
			deliver(ipa: ipa_path)
		else
			deliver()
		end
	end

	after_all do |lane|
  	end

  	error do |lane, exception|
  	end

end
