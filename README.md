#  Onnxruntime Pods

Onnxruntime build process is [explained here](https://docs.google.com/document/d/1bUyBwH-3E_a4c87g7_4mmwy6ntxw2p6rfvEQaQW4uw8/edit#heading=h.lq7mns3nfx98)

Latest onnxruntime branch used for the build is [available here](https://github.com/microsoft/onnxruntime/pull/17103)

Pods are built on an M1-chip Mac

Source: https://github.com/scanlel/onnxruntime/tree/main
Build script: https://github.com/scanlel/onnxruntime/blob/main/iosbuilder.sh

Build settings: 
```
{
    "build_osx_archs": {
        "iphoneos": [
            "arm64"
        ],
        "iphonesimulator": [
            "arm64",
            "x86_64"
        ]
    },
    "build_params": [
        "--ios",
        "--parallel",
        "--use_xcode",
        "--build_apple_framework",
        "--minimal_build=extended",
        "--disable_rtti",
        "--skip_tests",
        "--apple_deploy_target=9.0",
        "--enable_training_apis",
        "--use_extensions",
        "--extensions_overridden_path=cmake/external/onnxruntime-extensions",
        "--cmake_extra_defines=onnxruntime_BUILD_UNIT_TESTS=OFF",
        "--cmake_extra_defines=OCOS_ENABLE_TF_STRING=ON"
    ]
}
```

Required operators:
```
ai.onnx;1;Not
ai.onnx;7;And
ai.onnx;9;Where
ai.onnx;11;OneHot
ai.onnx;13;Cast,Concat,Equal,Expand,Gather,Gemm,Greater,Log,MatMul,Max,Neg,ReduceMax,ReduceMean,ReduceSum,ScatterND,Sigmoid,Size,Slice,SoftmaxCrossEntropyLoss,Squeeze,Sum,Transpose,Unsqueeze
ai.onnx;14;Add,Div,Mul,Relu,Reshape,Sub
ai.onnx;15;BatchNormalization,Shape
ai.onnx.contrib;1;StringToHashBucketFast
ai.onnx.ml;1;CategoryMapper
com.microsoft;1;AdamWOptimizer,BatchNormInternal,BatchNormalizationGrad,ConcatTraining,FusedGemm,InPlaceAccumulatorV2,ReluGrad,Scale,SigmoidGrad,SoftmaxCrossEntropyLossGrad,SplitTraining,TanhGrad
```

Latest commit hash at the time the build happened:
```
20ff81f00ba0e5f100e50d0225f73e346ea32eed
```
