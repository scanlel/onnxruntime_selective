// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#import "ort_checkpoint.h"

#import "cxx_api.h"

NS_ASSUME_NONNULL_BEGIN

__attribute__((availability(ios,strict,introduced=12.0)))
@interface ORTCheckpoint ()

- (Ort::CheckpointState&)CXXAPIOrtCheckpoint;

@end

NS_ASSUME_NONNULL_END
