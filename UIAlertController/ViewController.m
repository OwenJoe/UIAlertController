//
//  ViewController.m
//  UIAlertController
//
//  Created by imac on 16/5/30.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIAlertController *alertVc;

@property (nonatomic,weak) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


/**
 *  样式一
 *
 *  @param sender <#sender description#>
 */
- (IBAction)buttonClick:(id)sender {
    
   self.alertVc  = [UIAlertController alertControllerWithTitle:@"标题一" message:@"这里是要显示的信息" preferredStyle:UIAlertControllerStyleAlert];
    
    //弹出视图,使用UIViewController的方法
    [self presentViewController:self.alertVc animated:YES completion:^{
        
        //隔一会就消失
        [self dismissViewControllerAnimated:YES completion:^{

        }];
    }];
}


/**
 *  样式二
 *
 *  @param sender <#sender description#>
 */
- (IBAction)buttonClick02:(id)sender {
    
    self.alertVc  = [UIAlertController alertControllerWithTitle:@"标题二" message:@"这里是要显示的信息" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //弹出视图,使用UIViewController的方法
    [self presentViewController:self.alertVc animated:YES completion:^{
        
        //隔一会就消失
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    
}


/**
 *  样式三
 *
 *  @param sender <#sender description#>
 */
- (IBAction)buttonClick03:(id)sender {
    
    self.alertVc = [UIAlertController alertControllerWithTitle:@"标题三" message:@"这是标题内容" preferredStyle:UIAlertControllerStyleActionSheet];//UIAlertControllerStyleActionSheet
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    


    
#warning  修改字体颜色,属于私有Api 慎用
    [cancelAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    
    
    [self.alertVc addAction:cancelAction];
    [self.alertVc addAction:sureAction];
    
    //弹出视图,使用UIViewController的方法
    [self presentViewController:self.alertVc animated:YES completion:^{
        
        
    }];
}


/**
 *  样式四
 *
 *  @param sender <#sender description#>
 */
- (IBAction)buttonClick04:(id)sender {
    
    self.alertVc = [UIAlertController alertControllerWithTitle:@"标题四" message:@"标题内容" preferredStyle:UIAlertControllerStyleAlert];
    
    [self.alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"请输入用户名";
    }];
    
    [self.alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"请输入密码";
        textField.secureTextEntry = YES;
    }];
    
    //对UITextField开始监听
    [self.alertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"输入可以监听到";
        _textField = textField;
        
#warning 监听输入,可以使用通知,可以kvo等,如果是下边的这种方式,容易retain,造成循环引用,所以声明一个全局变量textField,然后在block监听,就不会造成循环引用(capturing 'self'strong in this block is likely to lead to a retain cycle)
//       [textField addTarget:self action:@selector(watchTextFieldMethod:) forControlEvents:UIControlEventEditingChanged];
    }];
    
    
    [_textField addTarget:self action:@selector(watchTextFieldMethod:) forControlEvents:UIControlEventEditingChanged];
    

    
    //添加确定和取消按钮
    UIAlertAction *cacleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];

    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [self.alertVc addAction:cacleAction];
    [self.alertVc addAction:sureAction];
    
    
    [self presentViewController:self.alertVc animated:YES completion:^{
        
    }];
}


/**
 *  监听输入的UITextField
 */
-(void)watchTextFieldMethod:(UITextField *)textField{

    NSLog(@"正在获取输-->:%@",textField.text);
}









@end
