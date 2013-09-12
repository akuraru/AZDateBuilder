Pod::Spec.new do |s|

  s.name         = "AZDateBuilder"
  s.version      = "0.0.1"
  s.summary      = "Simple NSDate builder library."

  
  s.homepage     = "https://github.com/azu/AZDateBuilder"
  s.license      = 'MIT'

  s.author       = { "azu" => "info@efcl.info" }
  s.platform     = :ios, '5.0'

  s.source       = { :git => "https://github.com/azu/AZDateBuilder.git", :commit => "6b518f7bd7dce9e729647a62904998872c33801b" }
  s.source_files  = 'Lib/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
end
