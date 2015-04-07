// -*- ObjC -*-
#import "APViewController.h"
#import <AssetsLibrary/ALAssetsLibrary.h>

#include "Login_Layer.h"

@interface APViewController ()
//@property (nonatomic) UIImagePickerController *imagePickerController;
@end

@implementation APViewController

+ (APViewController*) takePhoto
{
  UIWindow *window = [[UIApplication sharedApplication] keyWindow];
  APViewController *viewController = [[APViewController alloc] init];
  
  [window addSubview:viewController.view];
   viewController.view.tag = 10000;
  
  
 // [viewController openCamera];
  [viewController chooseImageSour];
  return viewController;
}
-(id) init
{
  if ((self = [super init]))
  {
    
  }
  return self;
}



- (void) chooseImageSour
{
   NSLog(@"chooseImageSour");
   UIActionSheet *chooseImageSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo library", nil];
  [chooseImageSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
  NSLog(@"clickedButtonAtIndex");
  switch (buttonIndex)
  {
    case 0:
    {
      
      NSLog(@"clickedButtonAtIndex 0------{{");
      [self openCamera];
     NSLog(@"clickedButtonAtIndex 0 -------}}");
      break;
    }
    case 1:
    {
      
      NSLog(@"clickedButtonAtIndex 1");
      if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusNotDetermined)
      {
        
        ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
        
        [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
          
          if (*stop) {
            //点击“好”回调方法:
            NSLog(@"好");
            return;
            
          }
          *stop = TRUE;
          
        } failureBlock:^(NSError *error) {
          
          //点击“不允许”回调方法:
          NSLog(@"不允许");
          [self dismissViewControllerAnimated:YES completion:nil];
          
        }];
      }
      [self openLibrary];
      
      break;
    }
    case 2:
    {
      
      NSLog(@"clickedButtonAtIndex 2");
      [self.view removeFromSuperview];
      break;
    }
    default:
    {
       NSLog(@"default");
      [self.view removeFromSuperview];

      break;
    }
  }
  
  NSLog(@"removeFromSuperview 0 -------}}");
  [self.view removeFromSuperview];
  
}
- (void) openCamera2
{
  NSLog(@"openCamera2");
  UIImagePickerController * picker = [[UIImagePickerController alloc] init];
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
-(void) openLibrary
{
  NSLog(@"openLibrary");
  UIImagePickerController * picker = [[UIImagePickerController alloc] init];
  picker.delegate = self;

  
  picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
  {
    _popOver = [[UIPopoverController alloc] initWithContentViewController:picker];
    [_popOver presentPopoverFromRect:CGRectMake(0, 800, 500, 500) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    _popOver.delegate = self;
  }
  else
  {
    [self presentViewController:picker animated:YES completion:nil];
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

//拍照
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
  NSLog(@"拍照");

  UIImage *originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
  
  UIImage *scaleImage = [self scaleImage:originImage toScale:0.3];
  
   NSData *data;
  
   data = UIImagePNGRepresentation(scaleImage);
  
  NSLog(@"拍照 = %d",[data length]);
  int n = [data length];
  const char* image_data =   (const char*) [data bytes];
  //保存原图到相册
  //UIImageWriteToSavedPhotosAlbum(scaleImage, nil, nil, nil);
  
  Login_Layer::instance()->show_image(image_data,n);
  [picker dismissViewControllerAnimated:false completion:nil];
  

  [self.view removeFromSuperview];
  
 // [self dismiss];
  
  
}
//取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  NSLog(@"取消");
  
  [picker dismissViewControllerAnimated:false completion:nil];
  
  [self.view removeFromSuperview];
  
  
}

-(void) dealloc
{
  [self release];
  [super dealloc];
}

- (BOOL) shouldAutorotate {
  return NO;
}

#pragma mark- 缩放图片
-(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
  UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
  [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
  UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return scaledImage;
}

- (void) dismiss
{
#if 0
  UIWindow *window = [[UIApplication sharedApplication] keyWindow];
  
  NSArray *views =   [window subviews];
  
  for(UIView* view in views)
  {
    if (view.tag == 10000)
    {
      [view removeFromSuperview];
      
    }
  }
#endif
  
  
}
@end
