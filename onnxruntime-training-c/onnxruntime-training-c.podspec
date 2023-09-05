Pod::Spec.new do |spec|
    spec.name                   = "onnxruntime-training-c"
    spec.version                = "1.16.0-local"
    spec.authors                = { "ONNX Runtime" => "onnxruntime@microsoft.com" }
    spec.license                = { :type => "MIT", :file => "LICENSE" }
    spec.homepage               = "https://github.com/microsoft/onnxruntime"
    spec.source                 = { :http => "file:///http_source_placeholder" }
    spec.summary                = "ONNX Runtime Training C/C++ Pod"
    spec.platform               = :ios, "9.0"
    spec.vendored_frameworks    = "onnxruntime.xcframework"
    spec.static_framework       = true
    spec.weak_framework         = [  ]
    spec.source_files           = "Headers/*.h"
    spec.preserve_paths         = [ "LICENSE" ]
    spec.description            = "A pod for the ONNX Runtime C/C++ library. This pod supports additional training features."
    spec.library                = "c++"
    spec.pod_target_xcconfig    = {
        "OTHER_CPLUSPLUSFLAGS" => "-fvisibility=hidden -fvisibility-inlines-hidden",
    }
end
