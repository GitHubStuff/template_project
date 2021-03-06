part of 'main.dart';

/// Create a [dark] theme
/// TODO: Build themes by using  [DefaultDarkThemeData] as a starting point
final _darkThemeData = DefaultDarkThemeData.copyWith(
  primaryColor: Colors.yellow,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.green,
    backgroundColor: Colors.purple,
  ),
);

/// Create a [light] theme
/// TODO: Build themes by using  [DefaultLightThemeData] as a starting point
final _lightThemeData = DefaultLightThemeData.copyWith(
  primaryColor: Colors.pink[100],
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.pink,
    backgroundColor: Colors.yellow,
  ),
);
