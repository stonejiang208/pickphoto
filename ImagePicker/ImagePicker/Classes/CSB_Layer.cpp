// -*- C++ -*-
//===========================================================================
/* Time-stamp: <2015-04-02 15:52:39 by jiangtao> */

/* @file CSB_Layer.cpp
 * $Id: CSB_Layer.cpp 2015-01-26 14:43:28 jiangtao Exp $
 *
 * @author:Stone Jiang<jiangtao@tao-studio.net>
 */
//===========================================================================


#include "CSB_Layer.h"


CSB_Layer::CSB_Layer()
	: node_ (nullptr)
{
	
}

CSB_Layer::~CSB_Layer()
{
	CC_SAFE_RELEASE (node_);
}


void CSB_Layer::set_callback(Widget*)
{
	// subclass 
}

bool CSB_Layer::init()
{
	if (!Base::init ())
	{
		return false;
	}
	std::string filename = get_csb_filename ();
	Widget* node = static_cast<Widget*>(CSLoader::createNode (filename));
	if (!node)
	{
   
		return nullptr;
	}
  this->addChild (node);
	node->retain ();
	node_ = node;
	set_callback (node_);
  return  true;
}



Closeable_Layer::Closeable_Layer ()
{
}


Closeable_Layer::~Closeable_Layer ()
{
}

bool Closeable_Layer::init ()
{
	if (!Base::init ())
	{
		return false;
	}

	do
	{
    CC_BREAK_IF(!node_);

   
		Button* close_button =
			static_cast <Button*> (Helper::seekWidgetByName (node_,"Button_Close"));
    if (close_button)
    {
	   	close_button->addClickEventListener (
		   	CC_CALLBACK_1 (Self::on_close, this));
    }
    
  } while (0);
	return true;
}
void Closeable_Layer::dismiss()
{	
 this->removeFromParent();
}
void Closeable_Layer::on_close (Ref*)
{
     this->runAction(
			 Sequence::create(ScaleTo::create(0.2f, 0.2f),
												CallFunc::create(CC_CALLBACK_0(Self::dismiss,this)), NULL));
}

Click_Closeable_Layer::Click_Closeable_Layer ()
{
}

Click_Closeable_Layer::~Click_Closeable_Layer ()
{
}


bool Click_Closeable_Layer::init ()
{
	bool retval = false;
	do
	{
		CC_BREAK_IF (!Base::init ());
		
		retval = true;
	} while (0);
	return retval;
}
