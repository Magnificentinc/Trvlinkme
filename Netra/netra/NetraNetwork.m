//
//  NetraNetwork.m
//  Netra
//
//  Created by Arie on 10/27/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "NetraNetwork.h"


static NSString * const netraBaseUrl = @"https://alpha-api.app.net/";
static NetraNetwork *_netraClient = nil;
@implementation NetraNetwork

+ (instancetype)netraClient {
	
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _netraClient = [[NetraNetwork alloc] initWithBaseURL:[NSURL URLWithString:netraBaseUrl]];
    });
    
    return _netraClient;
}
@end