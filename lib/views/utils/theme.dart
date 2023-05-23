import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

abstract class AppColors {
  static const Color backgroundLight = Color.fromRGBO(240, 240, 240, 1);
  static const Color appBarLight = Color.fromRGBO(230, 230, 230, 1);
  static const Color cardLight = Color.fromRGBO(230, 230, 230, 1);
  static const Color textLight = Color.fromRGBO(200, 200, 200, 1);

  static const Color backgroundDark = Color.fromRGBO(17, 18, 40, 1);
  static const Color appBarDark = Color.fromRGBO(9, 10, 32, 1);
  static const Color cardDark = Color.fromRGBO(26, 27, 53, 1);
  static const Color mainbuttonColor = Color.fromRGBO(93, 47, 167, 1.0);
  static const Color mainbuttonColor2 = Color.fromRGBO(71, 18, 155, 1);
  static const Color mainbuttonColor3 = Color.fromRGBO(101, 44, 191, 1.0);
  static const Color whiteColor = Color(0xFFF5F5F5);
  static const Color textDark = Color.fromRGBO(49, 44, 56, 1);
  static const Color textGray = Color.fromRGBO(136, 141, 146, 1);
  static const Color whiteLikeColor = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color likeColor = Color.fromRGBO(251, 7, 66, 1);
}

abstract class _LightColors {
  static const background = AppColors.backgroundLight;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = AppColors.backgroundDark;
  static const card = AppColors.cardDark;
}

abstract class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  ///Light theme
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        accentColor: AppColors.backgroundLight,
        visualDensity: visualDensity,
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.appBarLight,
            titleTextStyle: TextStyle(
                color: AppColors.textDark,
                fontSize: 20,
                fontWeight: FontWeight.w600),
            iconTheme: IconThemeData(color: AppColors.textDark),
            elevation: 2),
        backgroundColor: _LightColors.background,
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme:
            TextTheme(headline6: TextStyle(color: AppColors.textDark)),
      );

  ///Dark theme
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        accentColor: AppColors.backgroundDark,
        visualDensity: visualDensity,
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.appBarDark,
            titleTextStyle: TextStyle(
                color: AppColors.textLight,
                fontSize: 20,
                fontWeight: FontWeight.w600),
            iconTheme: IconThemeData(color: AppColors.textLight),
            elevation: 2),
        textTheme: TextTheme(bodyMedium: TextStyle(color: AppColors.textLight)),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme:
            TextTheme(headline6: TextStyle(color: AppColors.textLight)),
      );
}

/// theme mode controller
class ThemeServices {
  final _box = GetStorage();
  final _key = "isDarkMode";

  _saveThemeBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeBox(!_loadThemeFromBox());
  }
}
