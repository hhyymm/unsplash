//
//  HHRequestParametersHelp.m
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "HHRequestParametersHelp.h"

@implementation HHRequestParametersHelp

+ (NSDictionary *)defaultParameters
{
    return @{
             };
}

+ (NSDictionary *)parameters:(NSDictionary*)orgainParameters
{
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    [dict addEntriesFromDictionary:orgainParameters];
//    [dict addEntriesFromDictionary:[HHRequestParametersHelp defaultParameters]];

//    NSTimeInterval time = [[NSDate date]timeIntervalSince1970];
//    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
//    dict[@"timestamp"] = @([timeString integerValue]);

//    NSString *sign = [self param:dict andTimeStr:timeString andApiStr:key];
//    dict[@"sign"] = sign;
    return orgainParameters;
}

@end
