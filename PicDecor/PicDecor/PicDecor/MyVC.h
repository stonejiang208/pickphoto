// -*- C++ -*-
//===========================================================================
/* Time-stamp: <2015-04-08 12:23:04 by jiangtao> */

/* @file MyVC.h
 * $Id: MyVC.h 2015-04-08 04:23:02 jiangtao 
 *
 * @author:Stone Jiang<jiangtao@tao-studio.net>
 */
//===========================================================================

#ifndef MYVC_H
#define MYVC_H

#import <UIKit/UIKit.h>

@interface MyVC :
  UIViewController <
    UIImagePickerControllerDelegate,
   UINavigationControllerDelegate
>
{
  
}
+ (MyVC*) foo;
@end

#endif /* MYVC_H */
