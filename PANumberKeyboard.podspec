Pod::Spec.new do |s|

  s.name          = "PANumberKeyboard"
  s.version       = "0.0.4"
  s.summary       = "PANumberKeyboard is a UIViewController with custom decimal keyboard"
  s.homepage      = "https://github.com/AlexeyYuPopkov/PANumberKeyboard"
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = { "Alexey Popkov" => "alexey.yu.popkov@gmail.com" }
  s.platform      = :ios, "8.0"
  s.source        = { :git => "https://github.com/AlexeyYuPopkov/PANumberKeyboard.git", :tag => s.version.to_s}
  s.source_files  = "Classes/*.{swift}"
  s.resources     = "Resources/*.{png,xib}"
  s.framework     = 'Foundation'

end
