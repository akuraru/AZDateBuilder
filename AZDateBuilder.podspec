Pod::Spec.new do |s|

  s.name         = "AZDateBuilder"
  s.version      = "1.0.1"
  s.summary      = "Simple NSDate builder library."
  s.homepage     = "https://github.com/azu/AZDateBuilder"
  s.license      = 'MIT'
  s.author       = { "azu" => "info@efcl.info" }
  s.platform     = :ios, '11.4'
  s.source       = {
    :git => "https://github.com/azu/AZDateBuilder.git",
    :tag => s.version.to_s
  }
  s.swift_version = '4.1'
  s.requires_arc = true

  s.default_subspec = 'ObjC'

  s.subspec 'ObjC' do |ss|
    ss.source_files  = 'Lib/**/*.{h,m}'
  end

  s.subspec 'Swift' do |ss|
    ss.source_files  = 'Lib/**/*.{swift}'
  end
end
