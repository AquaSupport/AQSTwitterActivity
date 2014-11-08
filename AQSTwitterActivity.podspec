Pod::Spec.new do |s|
  s.name         = "AQSTwitterActivity"
  s.version      = "0.1.0"
  s.summary      = "[iOS] UIActivity Class for Twitter"
  s.homepage     = "https://github.com/AquaSupport/AQSTwitterActivity"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AquaSupport/AQSTwitterActivity.git", :tag => "v0.1.0" }
  s.source_files  = "AQSTwitterActivity/Classes/**/*.{h,m}"
  s.resources = ["AQSTwitterActivity/Classes/**/*.png"]
  s.requires_arc = true
  s.platform = "ios", '7.0'

  s.frameworks = "Social"
end