//
//  AppStatus.m
//  界面传值的代码
//
//  Created by 纵昂 on 2017/2/26.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "AppStatus.h"

@implementation AppStatus

@synthesize contextStr = _contextStr;

static AppStatus * _instance =nil;

+(AppStatus *)shareInstance{
    if (_instance == nil) {
        _instance =[[super alloc]init];
    }
    return _instance;
}

-(id)init{
    if (self =[super init]) {
        
    }
    return self;
}

@end
