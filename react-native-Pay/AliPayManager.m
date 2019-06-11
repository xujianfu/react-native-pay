//
//  AliPayManager.m
//  ReactFlyApp
//
//  Created by Fan on 2018/2/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "AliPayManager.h"
#import <AlipaySDK/AlipaySDK.h>
@implementation AliPayManager

+(instancetype)sharedManager {
  static dispatch_once_t onceToken;
  static AliPayManager *instance;
  dispatch_once(&onceToken, ^{
    instance = [[AliPayManager alloc] init];
  });
  return instance;
}

-(void)dealWithAliPayCallBackUrl:(NSURL *)url{
  [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
    NSLog(@"result = %@",resultDic);
    //支付回调
    NSString *resultStatus = [resultDic objectForKey:@"resultStatus"];
    if ([resultStatus isEqualToString:@"9000"]){ //订单支付成功
      _paySuccess(nil,@"支付成功");;
    }else if([resultStatus isEqualToString:@"6002"]){//网络错误
      _payFailure(nil,@"网络错误");
    }else if([resultStatus isEqualToString:@"6001"]){//中途取消
       _payFailure(nil,@"支付取消");
    }else{//处理失败
      _payFailure(nil,@"支付失败");
    }
  }];
}



@end
