import 'package:flutter/material.dart';
import 'package:mybank/ui_screens/home/home_screen.dart';
import 'package:mybank/ui_screens/login/login_screen.dart';
import 'package:mybank/ui_screens/Photos/PhotoList_screen.dart';
import 'package:mybank/ui_screens/Albums/AlbumsList_screen.dart';
final routes = {
  '/login':         (BuildContext context) =>  new LoginScreen(),
  '/home':         (BuildContext context) => new HomeScreen(),
  '/album':         (BuildContext context) => new AlbumList_screen(),
  '/photo':        (BuildContext context) => new PhotoList_screen(),
  '/' :          (BuildContext context) => new LoginScreen(),
};