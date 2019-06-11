//
//  WXPay.m
//  微信支付
//

#import "WXPay.h"
#import "WXApi.h"
#import "WXApiManager.h"
#import "MD5Hash.h"
@implementation WXPay
+(void)pay:(NSDictionary *)info success:(void (^)(NSDictionary *, NSString *))success failure:(void (^)(NSDictionary *, NSString *))failure{
    WXApiManager*manager=[WXApiManager sharedManager];
    manager.payFailure=failure;
    manager.paySuccess=success;
    PayReq* req= [[PayReq alloc] init];
   NSMutableString *stamp  = [info objectForKey:@"timeStamp"];
   req.partnerId = [info objectForKey:@"partnerId"];
   req.prepayId = [info objectForKey:@"prepayId"];
   req.nonceStr = [info objectForKey:@"nonceStr"];
   req.timeStamp = stamp.intValue;
   req.package = [info objectForKey:@"package"];
   req.sign = [[MD5Hash get32MD5Hash: [info objectForKey:@"sign"]] uppercaseString] ;
   [WXApi sendReq:req];
}
@end
