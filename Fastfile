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

default_platform(:ios)

platform :ios do

	before_all do
		set_build_number
  	end

	desc "set build number"
	lane :set_build_number do
		# 更新构建版本号
		increment_build_number(build_number: ENV["build_number"])
	end

	desc "build a test ipa"
	lane :beta do
		gym(
			scheme: ENV["scheme"],
			clean: true,
			configuration: "Debug",#Release, Debug
			export_method: "development",#app-store, ad-hoc, development
			output_directory: ENV["ipa_folder_beta"]
		)

		# 使用 fastlane 插件 上传 firim
		firim(firim_api_token: ENV["firim_token"])
 	end

	desc "build a release ipa"
	lane :release do
		gym(
			scheme: ENV["scheme"],
			clean: true,
			configuration:"Release",
			export_method:"app-store",
			output_directory: ENV["ipa_folder_release"]
			)
		submit_review
	end

	desc "build a ijiami ipa"
	lane :ijiami do
		# 使用爱加密打混淆包 需要指定工具链和配置参数（其他混淆工具，参看各自文档）
		gym(
			scheme: ENV["scheme"],
			clean: true,
			configuration:"Release",
			export_method:"app-store",
			output_directory: ENV["ipa_folder_ijiami"],
			xcargs:"OTHER_CFLAGS='#{ENV["CFLAGS"]}' OTHER_CPLUSPLUSFLAGS='#{ENV["CFLAGS"]}' OTHER_SWIFT_FLAGS='#{ENV["SWIFTFLAG"]}'",
			toolchain:ENV["toolchain"]
			)
		submit_review
	end

	# 上传 iTC 提审相关详细参数在 Deliverfile 文件
	desc "upload binary to iTC"
	lane :submit_review do | options |
		#ipa文件的路径（外部调用 fastlane submit ipa:/../../ ）
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
