import 'package:flutter/material.dart';

import 'color/app_colors.dart';

ThemeData getThemeData() => ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,

      //! AppBar
      // appBarTheme: AppBarTheme(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.elliptical(20, 20),
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: AppColors.appBarColor.withOpacity(0.3),
      //   elevation: 0,
      // ),

      //! IconButtonTheme
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          alignment: Alignment.centerRight,
        ),
      ),

      //! IconThem
      iconTheme: IconThemeData(color: AppColors.iconColor),
    );
