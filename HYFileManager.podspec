Pod::Spec.new do |spec|
  spec.name         = 'HYFileManager'
  spec.version      = '0.1.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/castial/HYFileManager'
  spec.authors      = { 'Hyyy' => 'liyangliyang001@gmail.com' }
  spec.summary      = 'HYFileManager is a powerful util based on NSFileManager.'
  spec.source       = { :git => 'https://github.com/castial/HYFileManager.git', :tag => '0.1.1' }
  spec.source_files = 'HYFileManager/*.{h,m}'
  spec.platform     = :ios, '5.0'
  spec.framework    = 'Foundation', 'UIKit'
  spec.requires_arc = true
end
