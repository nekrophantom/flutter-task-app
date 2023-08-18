// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_app/views/auth/login_view.dart';
import 'package:task_app/views/auth/register_view.dart';
import 'package:task_app/views/home_view.dart';

class AppRoutes{

  static const home     = '/home';
  static const login    = '/login';
  static const logout   = '/logout';
  static const register = '/register';

  static Map<String, WidgetBuilder> routes = {
    home      : (context) => HomeView(),
    login     : (context) => LoginView(),
    register  : (context) => RegisterView()
  };

}