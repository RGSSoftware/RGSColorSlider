Pod::Spec.new do |s|
  s.name             = 'RGSColorSlider'
  s.version          = '0.1.1'
  s.summary          = 'A simple color slider for iOS.'
  s.description      = <<-DESC
                        A simple, reusable color slider for iOS.
                       DESC

  s.homepage         = 'https://github.com/RGSSoftware/RGSColorSlider'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Randel Smith' => 'rs@randelsmith.com' }
  s.source           = { :git => 'https://github.com/RGSSoftware/RGSColorSlider.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'RGSColorSlider/Classes/**/*'
  s.resource_bundles = {
     'RGSColorSlider' => ['RGSColorSlider/Assets/*.png']
  }

end
