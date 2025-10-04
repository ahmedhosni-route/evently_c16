import 'package:evently_c16_online/core/provider/app_provider.dart';
import 'package:evently_c16_online/core/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    var user = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24)
            ),
            color: theme.primaryColorDark,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back ✨",
                            style: TextStyle(color: AppColors.lightColor),
                          ),
                          Text(
                            (user?.displayName ?? "").toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: AppColors.lightColor),
                          ),
                        ],
                      ),
                    ),
                    appProvider.isDark
                        ? Image.asset(
                            "assets/icons/dark.png",
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          )
                        : Image.asset(
                            "assets/icons/light.png",
                            width: 40,
                            height: 40,
                          ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text(appProvider.locale.toUpperCase(),style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    const Icon(Iconsax.location_outline,color: Colors.white,
                    ),
                    const SizedBox(width: 4,),
                    Text(
                      "Cairo , Egypt",
                      style: TextStyle(color: AppColors.lightColor),
                    ),
                  ],
                ),
                const SizedBox(height: 24,),
              ],
            ),
          ),
        )
      ],
    );
  }
}
