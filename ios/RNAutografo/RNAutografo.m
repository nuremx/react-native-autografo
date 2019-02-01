//
//  RNAutografo.m
//  RNAutografo
//
//  Created by César Guadarrama on 1/31/19.
//  Copyright © 2019 Nure. All rights reserved.
//

#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(AutografoViewManager, RCTViewManager)

RCT_EXTERN_METHOD(reset:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(
                  save:(nonnull NSNumber *)node
                  fileName: (nonnull NSString *)fileName
                  )
RCT_EXPORT_VIEW_PROPERTY(onSave, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(strokeColor, NSString)

@end
