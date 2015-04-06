// -*- ObjC -*-

#include "Image_Picker.h"

#import <UIKit/UIKit.h>


void Image_Picker::pick ()
{
	NSLog (@"------------------------------\n");
  UIImagePickerController *picker    = [[UIImagePickerController alloc]init];
  
  picker.sourceType = UIImagePickerControllerSourceTypeCamera;
  picker.wantsFullScreenLayout = YES;
  [picker presentModalViewController:picker animated:YES];
  
 
}
