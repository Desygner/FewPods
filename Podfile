def shared_base
  use_frameworks!
  inhibit_all_warnings!
  platform :ios, '10.0'
  # pod 'R.swift', '5.0.3'
  pod 'CocoaLumberjack/Swift', '3.7.2'
  pod 'NSLogger', '1.9.7'
  pod 'KeychainAccess', '~> 4.2.2'
end

def shared_pods
  # pod 'Alamofire', '~> 4.7.3'
  # pod "BetweenKit", "~> 2.0.0"
  # pod 'OneSignal', '2.8.8'
  # pod 'GoogleSignIn', '4.2.0'
  # pod 'PMAlertController', '3.5.0'
  # pod 'FSCalendar', '2.7.9'
  # pod 'RZUtils/Components/RZCollectionTableView'
  pod 'AMPopTip', '0.9'
  pod "SMScrollView"
  pod 'SSZipArchive', '2.2.2'
  # pod 'HTGradientEasing-Fixed'
  pod 'HTGradientEasing-Fixed', :git => 'https://github.com/Desygner/HTGradientEasing'
  pod 'AGGeometryKit+POP'
  pod 'Underscore.m', '0.3.0'
  pod 'RMPZoomTransitionAnimator'
  pod 'HexColors', '4.0.0'
  pod 'UIAlertController+Blocks'
  pod 'LGSideMenuController'
  pod 'EZYGradientView', :git => 'https://github.com/Niphery/EZYGradientView'
  pod 'Flurry-iOS-SDK/FlurrySDK', '11.4.0'
  pod "youtube-ios-player-helper"
  pod 'GzipSwift', '5.0.0'
  pod 'OnlyPictures', :git => 'https://github.com/Desygner/OnlyPictures'
  pod 'Sheeeeeeeeet'
end


target 'FewPods' do
  shared_base
  shared_pods
end


post_install do |installer|
  plist_buddy = "/usr/libexec/PlistBuddy"

  installer.pods_project.targets.each do |target|
    plist = "Pods/Target Support Files/#{target}/Info.plist"
    version = `#{plist_buddy} -c "Print CFBundleShortVersionString" "#{plist}"`.strip
    # stripped_version = /([\d\.]+)/.match(version).captures[0]
    #
    # version_parts = stripped_version.split('.').map { |s| s.to_i }
    #
    # # ignore properly formatted versions
    # unless version_parts.slice(0..2).join('.') == version
    #
    #   major, minor, patch = version_parts
    #
    #   major ||= 0
    #   minor ||= 0
    #   patch ||= 999
    #
    #   fixed_version = "#{major}.#{minor}.#{patch}"
    #
    #   puts "Changing version of #{target} from #{version} to #{fixed_version} to make it pass iTC verification."
    #
    #   `#{plist_buddy} -c "Set CFBundleShortVersionString #{fixed_version}" "#{plist}"`
    # end

    target.build_configurations.each do |config|
      if config.name != 'Debug'
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      else
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      end
    end

    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end

  # Fix TwitterKit xx is implemented in both issue, c.f. https://github.com/twitter/twitter-kit-ios/issues/18
  installer.aggregate_targets.each do |aggregate_target|
    aggregate_target.xcconfigs.each do |config_name, config_file|
      config_file.other_linker_flags[:frameworks].delete("TwitterCore")

      xcconfig_path = aggregate_target.xcconfig_path(config_name)
      config_file.save_as(xcconfig_path)
    end
  end

  # Set OnlyPictures version to 4 as doesn't build in 4.2
  # installer.pods_project.targets.each do |target|
  #   if ['OnlyPictures'].include? target.name
  #     target.build_configurations.each do |config|
  #       config.build_settings['SWIFT_VERSION'] = '4.0'
  #     end
  #   end
  # end
end
