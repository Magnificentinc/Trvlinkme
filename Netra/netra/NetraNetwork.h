//
//  NetraNetwork.h
//  Netra
//
//  Created by Arie on 10/27/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"

@interface NetraNetwork : AFHTTPSessionManager

+ (instancetype)netraClient;

@end

