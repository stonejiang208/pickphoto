// -*- C++ -*-
//===========================================================================
/* Time-stamp: <2015-04-03 11:29:11 by jiangtao> */

/* @file CSB_Layer.h
 * $Id: CSB_Layer.h 2015-01-26 14:43:20 jiangtao 
 *
 * @author:Stone Jiang<jiangtao@tao-studio.net>
 */
//===========================================================================

#ifndef CSB_LAYER_H
#define CSB_LAYER_H

#include "cocos2d.h"
#include "ui/CocosGUI.h"
#include "editor-support/cocostudio/ActionTimeline/CSLoader.h"
#include "cocostudio/CocoStudio.h"

#include <string>
USING_NS_CC;
using namespace cocos2d::ui;
class CSB_Layer
	: public Layer
{
	typedef CSB_Layer Self;
	typedef Layer Base;
public:
	CSB_Layer ();
	virtual ~CSB_Layer ();
	virtual std::string get_csb_filename() = 0;
	virtual void set_callback (Widget*);
	virtual bool init ();
protected:
	Widget* node_;
private:
	
};

/*
  touch-able

	on close 
*/

class Closeable_Layer
	: public CSB_Layer
{
	typedef CSB_Layer Base;
  typedef Closeable_Layer Self;
public:
	Closeable_Layer ();
	virtual ~Closeable_Layer ();
	virtual bool init ();
	virtual void on_close (Ref*);
protected:
	void dismiss ();
};


class Click_Closeable_Layer
: public Closeable_Layer
{
	typedef Closeable_Layer Base;
	typedef Click_Closeable_Layer Self;
public:
  Click_Closeable_Layer ();
  virtual ~Click_Closeable_Layer ();
  virtual bool init ();

protected:
	Node*  box_node_;
};
#endif /* CSB_LAYER_H */
