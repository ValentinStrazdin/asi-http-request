Pod::Spec.new do |s|
  s.name         = "ASIHTTPRequest"
  s.version      = "1.8.2"
  s.summary      = "Easy to use CFNetwork wrapper for HTTP requests, Objective-C, Mac OS X and iPhone."

  s.description  = \n    ASIHTTPRequest is an easy to use wrapper around the CFNetwork API that\n    makes some of the more tedious aspects of communicating with web servers\n    easier. It is written in Objective-C and works in both Mac OS X and iPhone\n    applications.\n\n    It is suitable performing basic HTTP requests and interacting with\n    REST-based services (GET / POST / PUT / DELETE). The included\n    ASIFormDataRequest subclass makes it easy to submit POST data and files\n    using multipart/form-data.\n\n    Please note that ASIHTTPRequest is not recommended for newer projects \n    since it's not actively maintained anymore. \n    For more info visit: http://allseeing-i.com/%5Brequest_release%5D\n

  s.homepage     = "http://allseeing-i.com/ASIHTTPRequest"
  s.license      = { :type => "BSD", :file => "LICENSE.md" }
  
  s.author             = { "Ben Copsey" => "ben@allseeing-i.com" }

  s.source       = { :git => "https://github.com/ValentinStrazdin/asi-http-request.git", :tag => s.version.to_s }

  s.subspec "Core" do |ss|
    ss.source_files = "Classes/*.{h,m}"
    ss.libraries = "z.1"
    ss.ios.dependencies = "Reachability"
    ss.ios.frameworks = "MobileCoreServices", "CFNetwork", "CoreGraphics"
    ss.osx.exclude_files = "**/*ASIAuthenticationDialog*"
    ss.osx.frameworks = "SystemConfiguration", "CoreServices"
  end

  s.subspec "ASIWebPageRequest" do |ss|
    ss.source_files = "Classes/ASIWebPageRequest/*.{h,m}"
    ss.libraries = "xml2.2"
    ss.dependencies = "ASIHTTPRequest/Core"
    ss.xcconfig.HEADER_SEARCH_PATHS = "\"$(SDKROOT)/usr/include/libxml2\""
  end

  s.subspec "CloudFiles" do |ss|
    ss.source_files = "Classes/CloudFiles/*.{h,m}", "Classes/S3/ASINSXMLParserCompat.h"
    ss.dependencies = "ASIHTTPRequest/Core"
  end

  s.subspec "S3" do |ss|
    ss.source_files = "Classes/S3/*.{h,m}"
    ss.dependencies = "ASIHTTPRequest/Core"
  end

  s.requires_arc = false
end
