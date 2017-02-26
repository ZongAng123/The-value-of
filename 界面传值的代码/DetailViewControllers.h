//
//  DetailViewControllers.h
//  界面传值的代码
//
//  Created by 纵昂 on 2017/2/25.
//  Copyright © 2017年 纵昂. All rights reserved.
//
// （一）属性传值
// （二）Block传值
// （三）代理传值
//block传值也是从第二个界面给第一个界面传值
//  3、RootViewControllers页面push到DetailViewControllers页面，如果DetailViewControllers页面的信息想回传（回调）到RootViewControllers页面，用代理传值，其中DetailViewControllers定义协议和声明代理，RootViewControllers确认并实现代理，RootViewControllers作为DetailViewControllers的代理
//  首先在DetailViewControllers.h文件中我们创建协议方法
#import <UIKit/UIKit.h>

//3.1第三种传值方式，代理
@class DetailViewControllers;

@protocol passingValueDelegate <NSObject>

@optional
-(void)viewController:(DetailViewControllers *)viewcontroller didPassingValueWithInfo:(id)info;
@end
// 2.1、首先我们在DetailViewcontrollers的.h文件中，属性
typedef void (^passingvalueBlock)(UILabel *);

@interface DetailViewControllers : UIViewController
// 1.1、首先我们建立一个RootViewControllers和一个DetailViewControllers，在DetailViewControllers中声明一个textString属性，用于接收传过来的字符串，
@property (nonatomic, copy) NSString * textString; //属性传值

@property (nonatomic, copy) passingvalueBlock passingValue; //使用block传值

@property (nonatomic, assign) id<passingValueDelegate>delegate; //通过代理对象传值

@end
