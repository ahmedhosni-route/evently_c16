import 'package:evently_c16_online/core/models/event_model.dart';
import 'package:evently_c16_online/modules/layout/pages/home_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/love_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/map_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/profile_screen.dart';
import 'package:evently_c16_online/modules/layout/services/layout_services.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {
  int btnNavIndex = 0;
  void onBtnChange(int index) {
    btnNavIndex = index;
    notifyListeners();
  }

  int tabIndex = 0;

  void onTabChange(int index) {
    tabIndex = index;
    notifyListeners();
  }

  Future<void> toggleFav(EventModel event) async {
    await LayoutServices.toggleFav(event);
    // notifyListeners();
  }

  List<EventModel> favList = [];

  void getFav() {
    var fav = LayoutServices.getFavStream();
    fav.listen(
      (event) {
        favList.clear();
        for (var e in event.docs) {
          favList.add(e.data());
        }
        notifyListeners();
      },
    );
  }

  Widget get screen => screens[btnNavIndex];

  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    LoveScreen(),
    ProfileScreen(),
  ];
}
