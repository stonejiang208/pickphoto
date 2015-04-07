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
Login_Layer* Login_Layer::instance_ = nullptr;
Login_Layer::Login_Layer()
{
  Login_Layer::instance_ = this;
}

Login_Layer::~Login_Layer()
{
  Login_Layer::instance_ = nullptr;
}

Login_Layer* Login_Layer ::instance()
{
  return Login_Layer::instance_;
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

void Login_Layer::show_image(const char* data, size_t len)
{
  
  std::string key = "myheader";
  Image* image = new Image ();
  if (image->initWithImageData ((const unsigned char *)data,len))
  {
    // SpriteFrameCache* cache = SpriteFrameCache::getInstance();
    
    TextureCache* tc =Director::getInstance()->getTextureCache();
    tc->addImage(image, key);
    
  }

  
  TextureCache* tc =Director::getInstance()->getTextureCache();
  Texture2D* texture = tc-> getTextureForKey (key);
  
  auto sp = Sprite::createWithTexture(texture);
  this->addChild(sp);
  sp->setPosition(Vec2 (300,800));
  sp->setScale(0.2f, 0.2f);
  
   CCLOG ("show_image");
}