import 'package:evently_c16_online/modules/layout/pages/home_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/love_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/map_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier{
  int btnNavIndex = 0;
  void onBtnChange(int index){
    btnNavIndex = index;
    notifyListeners();
  }

  Widget get screen => screens[btnNavIndex];

  List<Widget> screens  = [
    HomeScreen(),
    MapScreen(),
    LoveScreen(),
    ProfileScreen(),
  ];
}