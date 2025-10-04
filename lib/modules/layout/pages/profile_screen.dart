import 'dart:io';

import 'package:evently_c16_online/core/provider/app_provider.dart';
import 'package:evently_c16_online/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var user = FirebaseAuth.instance.currentUser!;
    var provider = Provider.of<AppProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(64)),
            color: theme.primaryColor,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(24),
                        bottomEnd: Radius.circular(360),
                        bottomStart: Radius.circular(360),
                        topEnd: Radius.circular(360),
                      ),
                      child: Image.asset(
                        "assets/logo/route.jpg",
                        width: 130,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (user.displayName ?? "").toUpperCase(),
                          style: TextStyle(
                              fontSize: 22, color: AppColors.lightColor),
                        ),
                        Text(
                          (user.email ?? ""),
                          style: TextStyle(
                              color: AppColors.lightColor, fontSize: 18),
                        ),
                      ],
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.language,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryColor)),
                child: DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                  value: provider.locale,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: "ar", child: Text("Arabic")),
                    DropdownMenuItem(value: "en", child: Text("English")),
                  ],
                  onChanged: (value) {
                    provider.changeLocale(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                context.locale.theme,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryColor)),
                child: DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                  value: provider.themeMode,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(
                        value: ThemeMode.light, child: Text("Light")),
                    DropdownMenuItem(
                        value: ThemeMode.dark, child: Text("Dark")),
                  ],
                  onChanged: (value) {
                    provider.changeThemeMode(value!);
                  },
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
