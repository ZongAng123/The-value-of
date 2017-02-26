//
//  DetailViewControllers.m
//  界面传值的代码
//
//  Created by 纵昂 on 2017/2/25.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import "DetailViewControllers.h"

@interface DetailViewControllers ()

@end

@implementation DetailViewControllers

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//  2.2、 同时创建一个Lable用来显示传过的字符串
    self.view.backgroundColor=[UIColor greenColor];
    UILabel * lab =[[UILabel alloc]initWithFrame:CGRectMake(20, 100, 300, 30)];
    lab.backgroundColor=[UIColor redColor];
    lab.font =[UIFont systemFontOfSize:20];
    lab.numberOfLines =0;
    lab.text=_textString; //使用属性得到传递的文本
    [self.view addSubview:lab];
}
// 3.2 -------------------------
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    视图将要消失时，通过代理传值
//    首次判定代理是否存在，并且代理能够响应代理方法时，才执行代理方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewController:didPassingValueWithInfo:)]) {
//       传递视图当前的背景颜色
        [self.delegate viewController:self didPassingValueWithInfo:self.view.backgroundColor];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
