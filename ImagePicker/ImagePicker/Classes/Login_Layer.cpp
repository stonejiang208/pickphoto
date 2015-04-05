// -*- C++ -*-
//===========================================================================
/* Time-stamp: <2015-04-05 10:46:17 by jiangtao> */

/* @file Login_Layer.cpp
 * $Id: Login_Layer.cpp 2015-04-05 02:42:39 jiangtao Exp $
 *
 * @author:Stone Jiang<jiangtao@tao-studio.net>
 */
//===========================================================================


#include "Login_Layer.h"
#include "Image_Picker.h"

Login_Layer::Login_Layer()
{
}

Login_Layer::~Login_Layer()
{
}



std::string Login_Layer::get_csb_filename()
{
  return "login/login-layer.csb";
}


void Login_Layer::set_callback(Widget* root)
{

  {
    std::string node_name = "Button_Login";
    auto node = static_cast<Button*>(Helper::seekWidgetByName(root,node_name));
    if (node)
    {
      node->addClickEventListener(CC_CALLBACK_1(Self::on_login,this));
    }
  }
  {
    std::string node_name = "Button_Test";
    auto node = static_cast<Button*>(Helper::seekWidgetByName(root,node_name));
    if (node)
    {
      node->addClickEventListener(CC_CALLBACK_1(Self::on_test,this));
    }
  }
}

void Login_Layer::on_login (Ref*)
{
  CCLOG ("on_login");
  Image_Picker ip;
  ip.pick ();
}

void Login_Layer::on_test (Ref*)
{
  CCLOG ("on_login");

}