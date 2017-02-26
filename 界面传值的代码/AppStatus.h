//
//  AppStatus.h
//  界面传值的代码
//
//  Created by 纵昂 on 2017/2/26.
//  Copyright © 2017年 纵昂. All rights reserved.
//   AppStatus.h  创建一个单例类 AppStatus
//  （四）单例传值
#import <Foundation/Foundation.h>
//  单例传值（实现共享）
@interface AppStatus : NSObject
{
    NSString *_contextStr;
}
@property (nonatomic, retain)NSString * contextStr;

//加号 是可以通过类名直接调用这个方法,
//而减号则要实例化逸个对象,然后通过实例化的对象来调用该方法!
//（+ 和java中的static 方法相似）

+(AppStatus *)shareInstance;
@end
