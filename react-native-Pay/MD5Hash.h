//  MD5Hash.m
//
//  Created by Fan  on 2016/10/31.
//  Copyright © 2016年 Interactive Technology. All rights reserved.

#import <Foundation/Foundation.h>

@interface MD5Hash : NSObject

+ (NSString *)getMD5Password:(NSString *)salt secondKid:(NSString *)password;
+ (NSString *)getMD5Password:(NSString *)salt secondKid:(NSString *)password thirdKid:(NSString *)servertime;

+ (NSString *)getMD5JobHash:(NSString *)userID secondKid:(NSString *)strToke;
+ (NSString *)getMD5JobHash:(NSString *)userID secondKid:(NSString *)strToke thirdKid:(NSString *)servertime;

+ (NSString *)get32MD5Hash:(NSString *)str;
+ (NSString *)get16MD5Hash:(NSString *)str;

@end

