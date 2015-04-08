
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
  [vc chooseSource];
  return vc;
}

- (void) dismiss
{
  NSLog (@"dismiss");
 [self.view removeFromSuperview];
  
}

- (void) chooseSource
{
  NSLog(@"chooseSource");
   [self openCamera];
  // [self dismiss];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
   NSLog(@"actionSheet %d",buttonIndex);
  if (buttonIndex == 0)
  {
    [self openCamera];
  }
}


-(void)openCamera
{
  
  NSLog(@"启动相机");
  UIImagePickerController *picker= [[UIImagePickerController alloc] init];
  picker.delegate = self;
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
  {
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
  }
  else
  {
    NSLog(@"模拟器无法打开相机");
  }
  [self presentViewController:picker animated:YES completion:nil];
  
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
  NSLog(@"拍照");
  UIImage *originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
  UIImageWriteToSavedPhotosAlbum(originImage, nil, nil, nil);

 //[picker dismissViewControllerAnimated:false completion:nil];
   [picker dismissViewControllerAnimated:YES completion:Nil];
 // [picker.presentingViewController dismissViewControllerAnimated:false completion:^{}];
// [picker.view removeFromSuperview];
  
  NSLog(@"拍照2");
 [self dismiss];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  NSLog(@"取消");
   [picker dismissViewControllerAnimated:false completion:nil];
  [self dismiss];
}


@end
