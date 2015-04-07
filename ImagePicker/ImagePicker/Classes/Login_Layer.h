// -*- C++ -*-
//===========================================================================
/* Time-stamp: <2015-04-05 10:46:44 by jiangtao> */

/* @file Login_Layer.h
 * $Id: Login_Layer.h 2015-04-05 02:42:33 jiangtao 
 *
 * @author:Stone Jiang<jiangtao@tao-studio.net>
 */
//===========================================================================

#ifndef LOGIN_LAYER_H
#define LOGIN_LAYER_H

#include "CSB_Layer.h"


class Login_Layer
	: public CSB_Layer
{
	typedef CSB_Layer Base;
	typedef Login_Layer Self;
public:
	Login_Layer ();
	virtual ~Login_Layer ();
	virtual void set_callback (Widget*);
	virtual std::string get_csb_filename ();
	CREATE_FUNC (Self);
public:
  
  static Login_Layer* instance ();
  static Login_Layer* instance_;
public:
  void on_login (Ref*);
  void on_test (Ref*);
  void show_image (const char* data, size_t len);
};
#endif /* LOGIN_LAYER_H */
