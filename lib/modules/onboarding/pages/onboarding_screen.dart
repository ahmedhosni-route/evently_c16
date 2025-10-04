import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_c16_online/core/provider/app_provider.dart';
import 'package:evently_c16_online/core/routes/app_route_name.dart';
import 'package:evently_c16_online/core/widgets/custom_btn.dart';
import 'package:evently_c16_online/main.dart';
import 'package:evently_c16_online/modules/auth/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Logo & App Name =====
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      "assets/logo/app_logo.png",
                      width: 50,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Hero(
                    tag: "appName",
                    child: Material(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Text(
                        "Evently",
                        style: GoogleFonts.jockeyOne(
                            color: AppColors.primaryColor, fontSize: 36),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8)
                ],
              ),

              const Spacer(),

              // ===== Onboarding Image =====
              Expanded(
                flex: 5,
                child: Center(
                  child: ZoomIn(
                    child: Image.asset("assets/images/onboarding_light.png"),
                  ),
                ),
              ),

              const Spacer(),

              // ===== Title & Description =====
              Text(
                context.locale.title,
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                context.locale.desc,
                style: theme.textTheme.bodyMedium,
              ),
              // ===== Language Switch =====
              Expanded(
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.locale.language,
                      style: TextStyle(
                        fontSize: 26,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AnimatedToggleSwitch<String>.rolling(
                      textDirection: TextDirection.rtl,
                      indicatorIconScale: 1.2,
                      current: provider.locale,
                      values: const ["en", "ar"],
                      iconList: [
                        Image.asset("assets/icons/en.png"),
                        Image.asset("assets/icons/ar.png"),
                      ],
                      onChanged: (value) {
                        provider.changeLocale(value);
                      },
                      style: ToggleStyle(
                        backgroundColor: Colors.transparent,
                        indicatorColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 12,
              ),
              Expanded(
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.locale.theme,
                      style: TextStyle(
                        fontSize: 26,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AnimatedToggleSwitch<ThemeMode>.rolling(
                      textDirection: TextDirection.ltr,
                      current: provider.themeMode,
                      values: const [ThemeMode.light, ThemeMode.dark],
                      onChanged: (value) {
                        provider.changeThemeMode(value);
                      },
                      iconList: [
                        Image.asset("assets/icons/light.png"),
                        Image.asset(
                          "assets/icons/dark.png",
                          color: provider.themeMode == ThemeMode.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                      indicatorIconScale: 1.2,
                      style: ToggleStyle(
                        backgroundColor: Colors.transparent,
                        indicatorColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ===== Start Button =====
              Center(
                child: CustomBtn(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRouteName.login);
                    },
                  text: context.locale.letsStart,
                  isLoading: false,
                  isExpanded: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
