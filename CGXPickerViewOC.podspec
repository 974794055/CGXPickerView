Pod::Spec.new do |s|
    s.name         = "CGXPickerViewOC"    #存储库名称
    s.version      = "0.0.1"      #版本号，与tag值一致
    s.summary      = "a CGXPickerViewOC选择器封装"  #简介
    s.description  = "a CGXPickerViewOC选择器封装"  #描述
    s.homepage     = "https://github.com/974794055/CGXPickerView-OC"      #项目主页，不是git地址
    s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
    s.author             = { "974794055" => "974794055@qq.com" }  #作者
    s.platform     = :ios, "7.0"                  #支持的平台和版本号
    s.source       = { :git => "https://github.com/974794055/CGXPickerView-OC.git", :tag => s.version }         #存储库的git地址，以及tag值
    s.source_files = 'CGXPickerViewOC/CGXPickerViewOC.h'
    #开源库头文件
    s.public_header_files = 'CGXPickerViewOC/CGXPickerViewOC.h'
    s.requires_arc = true #是否支持ARC
    
    s.subspec 'Custom' do |ss|
        ss.source_files = 'CGXPickerViewOC/Custom/**/*.{h,m}'
    end
    
    s.subspec 'Base' do |ss|
        ss.source_files = 'CGXPickerViewOC/Base/**/*.{h,m}'
        ss.dependency 'CGXPickerViewOC/Custom'
    end
    
    s.subspec 'AddressView' do |ss|
        ss.source_files = 'CGXPickerViewOC/AddressView/**/*.{h,m}'
        ss.dependency 'CGXPickerViewOC/Base'
    end
    
    s.subspec 'DateView' do |ss|
        ss.source_files = 'CGXPickerViewOC/DateView/**/*.{h,m}'
    end
    
    s.subspec 'StringView' do |ss|
        ss.source_files = 'CGXPickerViewOC/StringView/**/*.{h,m}'
        ss.dependency 'CGXPickerViewOC/Base'
    end
    
end

