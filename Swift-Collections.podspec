Pod::Spec.new do |s|
  s.name         = "Swift-Collections"
  s.version      = "0.1.0"
  s.summary      = "Set, Multimap, and Tree collections for Swift"
  s.description  = <<-DESC
More Collections for Swift introduces a few useful native collection types not currently in Swift.
These collections are designed to coexist with the Swift framework.

This library's API follow Swift's Array and Dictionary API closely. It is also influenced by
Apple's Foundation Framework and
[Google's Guava collections](https://code.google.com/p/guava-libraries/wiki/GuavaExplained).
More Collections for Swift are designed to be as simple as possible while still satisfying a
majority of each collection’s use cases.
DESC

  s.homepage     = "https://github.com/jbulat/Swift-Collections"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Jarrett Bulat" => "https://github.com/jbulat" }
  s.source       = { :git => "https://github.com/jbulat/Swift-Collections.git", :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files  = "Source", "Source/**/*.{swift}"
end
