import 'package:evently_c16_online/core/theme/app_colors.dart';
import 'package:evently_c16_online/modules/layout/manager/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: provider.screen,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                  side: const BorderSide(color: Colors.white, width: 5)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: provider.onBtnChange,
                currentIndex: provider.btnNavIndex,
                fixedColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.home_1_outline),
                      activeIcon: Icon(Iconsax.home_1_bold),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.location_outline),
                      activeIcon: Icon(Iconsax.location_bold),
                      label: "Map"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border_rounded),
                      activeIcon: Icon(Icons.favorite),
                      label: "LOVE"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      activeIcon: Icon(Icons.person),
                      label: "Profile"),
                ]),
          );
        },
      ),
    );
  }
}
