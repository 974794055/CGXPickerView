Pod::Spec.new do |s|
    s.name         = "CGXPickerViewSwift"   
    s.version      = "0.0.1"     
    s.summary      = "a CGXPickerViewSwift选择器封装"
    s.description  = "a CGXPickerViewSwift选择器封装"  
    s.homepage     = "https://github.com/974794055/CGXPickerView"    
    s.license      = { :type => "MIT", :file => "LICENSE" }   
    s.author       = { "974794055" => "974794055@qq.com" }
    s.platform     = :ios, "11.0"                 
    s.source       = { :git => "https://github.com/974794055/CGXPickerView.git", :tag => s.version }         
    s.requires_arc = true
    s.resources    = 'CGXPickerViewSwift/CGXPickerView.bundle'
    s.source_files = "CGXPickerViewSwift","CGXPickerViewSwift/**/*.swift"
    s.public_header_files  = "CGXPickerViewSwift","CGXPickerViewSwift/**/*.swift"
end

