// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:theme_package/theme_package.dart';

/// These are [Constant] that are used by the app, by creating [key/value] pairs in the [flavor specific]
/// file (eg: [/dev/constants.dart] or [/release/constants.dart]) the specific values for a [flavor]
/// can be defined
enum FlavorEnum {
  bulbColor,
  currentThemeIsAppDarkIcon,
  currentThemeIsAppLightIcon,
  currentThemeIsPlatformDarkIcon,
  currentThemeIsPlatformLightIcon,
  databaseName,
  fabColor,
  setThemeDarkIcon,
  setThemeDevice,
  setThemeLightIcon,
  textColors,
  textStyle,
  themeFabColor,
  themeFabIconColor,
}

/// Helpers to extract [common types] and [specific values] using the [Constant] values defined
extension Constants on FlavorEnum {
  /// for [developement] and [test] [flavors], checks each 'Constant' has a value
  static void check() => FlavorEnum.values.forEach((val) => val.value());

  String get key => EnumToString.convertToString(this);
  T value<T>() => FlavorConfig.lookup(this.key);
  Widget get icon => value<Widget>();
  String get string => value<String>();
  TextStyle get style => value<TextStyle>();
  Color get themeColor => value<ColorsForTheme>().color;
}
