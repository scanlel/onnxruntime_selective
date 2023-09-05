Pod::Spec.new do |s|
  s.name             = "onnxruntime-training-objc"
  s.version          = "1.16.0-local"
  s.summary          = "ONNX Runtime Objective-C Pod"
  s.description      = "A pod for the ONNX Runtime Objective-C training API."
  s.homepage         = "https://github.com/microsoft/onnxruntime"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "ONNX Runtime" => "onnxruntime@microsoft.com" }
  s.source           = { :http => "file:///http_source_placeholder" }
  s.ios.deployment_target = "9.0"
  s.preserve_paths = [ "LICENSE" ]
  s.default_subspec = "Core"
  s.static_framework = true

  s.subspec "Core" do |core|
    core.dependency "onnxruntime-training-c", "#{s.version}"
    core.requires_arc = true
    core.compiler_flags = "-std=c++17", "-fobjc-arc-exceptions", "-Wall", "-Wextra", "-Werror"

    include_dirs = [
      "objectivec"
    ].map { |relative_include_dir|
      '"${PODS_TARGET_SRCROOT}/' + relative_include_dir + '"'
    }

    core.pod_target_xcconfig = {
      "HEADER_SEARCH_PATHS" => include_dirs.join(" "),
      "OTHER_CPLUSPLUSFLAGS" => "-fvisibility=hidden -fvisibility-inlines-hidden",
    }

    core.public_header_files = [
      "objectivec/include/*.h"
    ]

    core.source_files = [
      "objectivec/include/*.h", "objectivec/*.h", "objectivec/*.m", "objectivec/*.mm"
    ]

    core.test_spec "Tests" do |test|
      test.source_files = [
        "objectivec/test/*.h", "objectivec/test/*.m", "objectivec/test/*.mm"
      ]

      test.resources = [
        "objectivec/test/testdata/*.ort", "onnxruntime/test/testdata/training_api/*.onnx", "onnxruntime/test/testdata/training_api/*.ckpt", "onnxruntime/test/testdata/training_api/*.in", "onnxruntime/test/testdata/training_api/*.out"
      ]
    end
  end
end
