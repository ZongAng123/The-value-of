//
//  RootViewControllers.m
//  界面传值的代码
//
//  Created by 纵昂 on 2017/2/25.
//  Copyright © 2017年 纵昂. All rights reserved.
//

// 1.3、在RootViewControllers上引入DetailViewControllers同时声明一个textField属性用来输入字符串
#import "RootViewControllers.h"
#import "DetailViewControllers.h"
#import "AppStatus.h"
@interface RootViewControllers ()
@property (nonatomic, retain) UITextField * textField12;
@end

@implementation RootViewControllers
//  懒加载
-(UITextField * )textField12 {
    if (!_textField12) {
        self.textField12 =[[UITextField alloc]initWithFrame:CGRectMake(20, 100, [UIScreen mainScreen].bounds.size.width-40, 40)];
        _textField12.borderStyle =UITextBorderStyleRoundedRect;
    }
    return _textField12;
}
// 1.4、然后在RootViewControllers上我们创建并添加一个button，当点击button时响应相应方法进行视图间的切换完成视图间的传值
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"界面传值";
    self.view.backgroundColor =[UIColor redColor];
    [self.view addSubview:self.textField12];

    
    UIButton * pushButton =[UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame =CGRectMake(0, 0, 80, 40);
    [pushButton setTitle:@"入栈显示" forState:UIControlStateNormal];
    pushButton.titleLabel.font =[UIFont systemFontOfSize:20];
    pushButton.center =self.view.center;
    [pushButton addTarget:self action:@selector(headlepush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];

}
//  2.2、 在RootViewControllers的.m文件中，其他不变，在button的响应方法里我们为block属性赋值完成block传值
//   3.3､RootViewControllers的.m文件中我们指定代理并让其执行代理的方法
-(void)headlepush:(UIButton *)sender{
    DetailViewControllers * detailVC =[[DetailViewControllers alloc]init];
//    创建完对象，就为对应的属性textString赋值
    detailVC.textString =self.textField12.text;  //1
    
    detailVC.passingValue =^(UILabel *alabel){   //2
        alabel.text =self.textField12.text;
    };
//    为delegateVC指定代理对象
//    detailVC.delegate =self;   //3
    
//    通过导航栏控制器push进入下一个界面
    [self.navigationController pushViewController:detailVC animated:YES];
}
//   3.4、把第二个视图的颜色传给第一个视图
-(void)viewController:(DetailViewControllers *)viewcontroller didPassingValueWithInfo:(id)info{
    self.view.backgroundColor =info;
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
