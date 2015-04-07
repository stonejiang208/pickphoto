// -*- ObjC -*-

#include "Image_Picker.h"

#import <UIKit/UIKit.h>
#import "APViewController.h"

void Image_Picker::pick ()
{
	NSLog (@"------------------------------\n");
  
  [APViewController takePhoto];

 
}
