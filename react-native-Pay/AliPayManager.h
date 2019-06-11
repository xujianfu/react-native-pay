//
//  AliPayManager.h
//  ReactFlyApp
//
//  Created by Fan on 2018/2/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
//支付成功Block的定义
typedef void(^PaySuccess)(NSDictionary *resultDic, NSString* message);
typedef void(^PayFailure)(NSDictionary *resultDic, NSString* message);
@interface AliPayManager : NSObject
@property (nonatomic,copy)PayFailure payFailure;
@property (nonatomic,copy)PaySuccess paySuccess;
+ (instancetype)sharedManager;
-(void)dealWithAliPayCallBackUrl:(NSURL *)url;
@end
