# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

workspace 'Marvel.xcworkspace'
project 'Marvel.xcodeproj'
project 'Common/MarvelDomain/MarvelDomain.xcodeproj'

target 'Marvel' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  project 'Marvel.xcodeproj'

  # Pods for Marvel
  pod 'Nuke'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  
  target 'MarvelTests' do
    pod 'RxTest', '~> 5'
    pod 'RxBlocking', '~> 5'
  end

end

target 'MarvelDomain' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  project 'Common/MarvelDomain/MarvelDomain.xcodeproj'
  
  # Pods for MarvelDomain
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  
end
