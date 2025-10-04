import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColorDark: AppColors.primaryColor,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
    ),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightColor,

appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
        color: AppColors.primaryColor
    ),
  color: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  elevation: 0,
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontSize: 24,
    color: AppColors.primaryColor
  )
),
inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.grey
            )

        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.grey
            )

        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.grey
            )

        ),
        errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.red
            )

        ),
        focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.red
            )

        )

),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 14, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
      titleSmall: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColorDark: AppColors.darkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
    ),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 24,
            color: AppColors.primaryColor
        )
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color:AppColors.primaryColor
            )

        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color:AppColors.primaryColor
            )

        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color:AppColors.primaryColor
            )

        ),
        errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.red
            )

        ),
        focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.red
            )

        )

    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 14, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      titleSmall: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
