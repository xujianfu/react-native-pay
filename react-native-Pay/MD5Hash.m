
//  MD5Hash.m
//
//  Created by Fan  on 2016/10/31.
//  Copyright © 2016年 Interactive Technology. All rights reserved.



#import "MD5Hash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Hash

+ (NSString *)getMD5Password:(NSString *)salt secondKid:(NSString *)password {
    NSMutableString *append = [[NSMutableString alloc] initWithString:salt];
    [append appendString:password];
    NSString *tempPassword = [NSString stringWithString:append];
    return [self get32MD5Hash:tempPassword];
}

+ (NSString *)getMD5Password:(NSString *)salt secondKid:(NSString *)password thirdKid:(NSString *)servertime {
    return [NSString stringWithString:[self getMD5Password:[self getMD5Password:salt secondKid:password] secondKid:servertime]];
}

+ (NSString *)getMD5JobHash:(NSString *)userID secondKid:(NSString *)strToke{
    NSMutableString *append = [[NSMutableString alloc] initWithString:userID];
    [append appendString:strToke];
    NSString *tempJobHash = [NSString stringWithString:append];
    return [self get32MD5Hash:tempJobHash];

}

+ (NSString *)getMD5JobHash:(NSString *)userID secondKid:(NSString *)strToke thirdKid:(NSString *)servertime{

    NSString * backStr = [NSString stringWithFormat:@"%@%@%@",userID,[self getMD5JobHash:userID secondKid:strToke],servertime];
    return [self get32MD5Hash:backStr];
}

+(NSString *)get32MD5Hash:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [[NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]lowercaseString];
}

+(NSString *)get16MD5Hash:(NSString *)str {
    return [[self get32MD5Hash:str] substringWithRange:NSMakeRange(8,16)];
}


@end
