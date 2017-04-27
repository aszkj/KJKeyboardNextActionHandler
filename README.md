# KJKeyboardNextActionHandler
项目中有没这样的需求，在登录页、注册页、绑定手机号页、修改密码、找回密码等页面，有一堆输入框，没输入完一个，然后键盘的右下角一般显示下一项\
最后一个输入框显示完成，所以这时候点击键盘下一项，需要跳到下一项输入框开始输入。。点击最后键盘的完成，需要进行登录或者注册等相关操作\
那么这是怎么实现的呢，这肯定要自己用代码去做，系统的输入框肯定做不到你点击下一项，然后就跳到下一个输入框,所以得自己用代码做\
因为很多页面都需要这样，所以这里把它抽出来做成一个工具类KJKeyboardNextActionHandler

使用很简单，只需要在viewDidAppear方法里面初始化它即可
  
  self.keyboardNextActionHandler = [[KJKeyboardNextActionHandler alloc] initWithTextContainerView:self.view lastNextAction:^{\
        NSLog(@"点击最后的完成");\
  }];\



