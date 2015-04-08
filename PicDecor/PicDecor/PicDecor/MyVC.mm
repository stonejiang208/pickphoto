
#import "MyVC.h"

@interface MyVC ()
{
}
@end


@implementation MyVC

+ (MyVC*) foo
{
  NSLog (@"foo");
  UIWindow *window = [[UIApplication sharedApplication] keyWindow];
  MyVC* vc = [[MyVC alloc] init];
  
  [window addSubview:vc.view];
  
  return vc;
}
@end
