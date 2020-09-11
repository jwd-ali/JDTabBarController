
Pod::Spec.new do |s|
  s.name         = "JDTabBarController"
  s.version      = "1.0.0"
  s.summary      = "JDTabBarController framework"
  s.description  = <<-DESC
                  You can add elegant JDTabBarController animation in your view with just 2 line of code
                   DESC
  s.homepage     = "https://github.com/jwd-ali/IOS-Portfolio"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Jawad Ali" => "L060214@gmail.com" }
  s.platforms    = { :ios => "11.0" }
  s.source       = { :git => "https://github.com/jwd-ali/JDTabBarController.git", :tag => "#{s.version}" }

  s.source_files = "Sources/**/*.{h,m,swift}"
  s.requires_arc = true
  s.swift_version = "5.0"
  
end
