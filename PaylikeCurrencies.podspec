Pod::Spec.new do |s|
  s.name             = 'PaylikeCurrencies'
  s.swift_version    = '4.0'
  s.version          = '0.2.0'
  s.summary          = 'Utility package to work with currencies in the Paylike ecosystem'
  s.description      = <<-DESC
This packages is a clone of the JS version and responsible for providing a handy
interface to handle currencies that can be used in the Paylike ecosystem
                       DESC

  s.homepage         = 'https://github.com/paylike/swift-currencies'
  s.license          = { :type => 'BSD-3', :file => 'LICENSE' }
  s.author           = { 'Paylike.io' => 'info@paylike.io' }
  s.source           = { :git => 'https://github.com/paylike/swift-currencies.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/PaylikeCurrencies/**/*'
end
