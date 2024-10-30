Pod::Spec.new do |spec|

    spec.name        = 'GitPods'
    spec.version     = '1.0.0'
    spec.summary     = 'Sample project to show git issue with CocoaPods v1.16'
 
    spec.description = <<-DESC
                       This is a sample project to reproduce issue with git repositories introduced in CocoaPods v1.16
                       DESC
 
    spec.homepage    = 'http://www.comelitgroup.com'
 
    spec.license      = { :type => "Copyright", :file => "ios/LICENSE" }
 
    spec.authors     = { "Andrea Busi" => "andrea.busi@comelit.it"}
 
    spec.platform    = :ios, "12.0"
 
    spec.source      = {
        :git => "https://github.com/comelit/cocoapods-gitissue.git", :tag => "v#{spec.version}"
    }
 
    spec.prepare_command = <<-CMD
                         ./installer.sh pod-init
                         CMD
 
    spec.source_files = 'cpplib/*.{h,cpp}', 'cpplib/include/**/*.h', 'ios/GitPods/*.{h,mm,m,swift}'
 
    spec.preserve_paths = 'cpplib/*.{h,cpp}', 'cpplib/include/**/*.h', 'ios/GitPods/*.{h,mm,m,swift}'
 
    spec.public_header_files = 'ios/GitPods/*.h'
    spec.private_header_files = 'cpplib/include/scan/*.h'
 
    spec.header_dir = 'scan'
 end
 