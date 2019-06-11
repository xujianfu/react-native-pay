//
//  ReactNativePay.h
//  ReactNativePay
//
//  Created by moker on 2017/4/10.
//  Copyright © 2017年 cxz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "React/RCTBridgeModule.h"
#define WX_APPKEY            (@"wfffffffffffffff")//自己申请的key
@interface ReactNativePay : NSObject<RCTBridgeModule>
@property (strong, nonatomic) RCTPromiseResolveBlock myResolve;
@property (strong, nonatomic) RCTPromiseRejectBlock myReject;

@end
