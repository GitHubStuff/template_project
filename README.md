# Template

Template of working app that how creates flavors, themes, properties, variables, and console log tracing, and uses **Modular** and **BLoC** to share instances of objects, and create **routes** for navigation

- *app_exception.dart*, the blue print for throw-able exceptions
- *tracers.dart*, the console logging tool for development and logging
- *observing_stateful_widget*, an extenstion to **Stateful** widget

**NOTE:**
*observing_stateful_widget* has states:
- **afterFirstLayoutComplete** - called when the widget completes its first render
- **reporTextScaleFactor** - if accessiblity changes the text scale factor
- **didChangePlateformBrightness** - renders brightness changes
- **didChangeAppLifeCycle** - called when the app is put in the background or returns from background
- **didChangeTextScaleFactor** - listens for changes in text scale factor then calls **reportTextScaleFactor**
- **dispose** - releases the observers when the widget is disposed.

## Getting Started

1. Go to [pub.dev](https://pub.dev) and read up on `modular` and `flutter_modular` packages
2. Down load this project and do platform prep [prep](#prep)
3. Use `main_dev.dart` as a templete to create `Themes, Theme Properties, variables,` and `banner widget`
4. Edit `app_module.dart` to add any additional routes and binds
5. Edit `app_theme_with_material_app_widget.dart` to add any additional properties to `MaterialApp`
6. Edit `app_scaffold_widget.dart` to add any additional properties to `Scaffold` <em>(this is where the theme is set, and it recieves changes notifications of changes in brightness)</em>
7. Edit/Replace `body_widget.dart` with the applications first page. <em>(if replacing make sure the edit <u>app_scaffold_widget.dart</u> and replace <u>BodyWidget</u> with new widget)</em>

### Structure
* `app_module` is a <u>MainModule</u>
* `app_theme_module` folder is a <u>Child Module</u>

## Caveats

* A property set on a ```theme``` IS available to both dark and light modes if only one property has that key example: This property will can be used for ```dark theme```. 

```dart
  /// A property for LIGHT mode
  final Map<String, dynamic> _lightThemeProperties = {'bulbColor': Color(0xffff8800)};

  /// In other class in DARK mode
  final bulbColor = FlavorConfig.flavorThemes.property<Color>('bulbColor');

  /// is the same as:
  final bulbColor = FlavorConfig.flavorThemes.property<Color>('bulbColor', allowNull: false, checkLightAndDarkThemes: true);
  // By default if a key is not found for current theme, the other theme is searched.
  /// By default 'null' properties throw an exception (this catches typo's in keys during app development).
```

* The template has several folders/files that are not part of Flutter templated when creating a new project

```swift
  /data               // on device data files
  /images             // use to hold images used by the app. theme.png
  /images/theme.png   // can be used for buttons that change brightness
  /languages          // folder intended for localization files
  /languages/en.json  // English localization
  /languages/es.json  // Spanish localization
```

## Prep

* In <em>project->.vscode</em> use this ```launch.json``` template
  
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "release",
      "request": "launch",
      "type": "dart",
      "program": "example/lib/main/release/main.dart"
    },
    {
      "name": "altered",
      "request": "launch",
      "type": "dart",
      "program": "example/lib/main/dev/main.dart"
    }
  ]
}
```
It is reasonable to have different ```configurations``` or ```flavors``` with diffent <em>themes, urls for backend or test, etc</em> . The template has two(2) flavors:<em>example/lib/main/dev/main.dart</em> and <em>example/lib/main/release/main.dart</em>

### VSCode/Flutter

* Edit ```pubspec.yml```

* * Change project ```name```, ```description``` fields
* * Make sure the ```theme_package``` points to the correct git repo
* Edit ```ios/Podfile``` and set the ```platform : ios, 12.4``` (12.4 or to whatever platform support)

### Android
* Edit ```build.gradle``` at <em>android/app/bundle.gradle</em>
* * Change ```applicationId``` to the correct reverse domain (at/hear line 40)
* Edit ```AndroidManifest.xml``` at <em>android/app/src/debug</em>
* * Change ```package=``` to the correct reverse domain
* Edit ```AndroidManifest.xml``` at <em>android/app/src/main</em>
* * Change the ```package=``` domain (at/near line 1 or 2)
* * Change the ```android:label=``` to the application name (at/near line 10)
* Edit ```MainActivity.kt``` at <em>android/app/src/main/kotlin/example/example</em>
* * Change the ```package``` to the proper reverse domain. Note: **IGNORE** errors like ```unresolved reference: io``` and ```Unresolved reference: Flutter Activity``` appear (the file is kotlin, but the code is java)
* Edit ```AndroidManifest.xml``` at <em>android/app/src/profile</em>
* * Change ```package=``` to proper reverse domain (at line 1)

### iOS
* It <u><em>MAY</em></u> be necessary to run a build from the command line so that the workspace has the correct ```main.dart``` as a ```User-Defined => FLUTTER_ROOT``` under ```TARGETS -> RUNNER -> (Basic) (Combined)``` for custom flavoring to work:
* * ```flutter build ios -t lib/main/dev/main.dart --no-tree-shake-icons``` <u></u>
* Open the ```Runner.wcworkspace``` in XCode
* * Edit ```Info.plist``` 
* * * Change the ```Bundle name``` to the app name
* * * If using ```Location Services```:
* * * * ```Privacy - Location Usage Description```
* * * * ```Privacy - Location When In Use Useage Description```
* * * <em>This is iOS-8 requirement, but is still needed eve if platform > 8</em>
* * Under <em>TARGETS->Runner->'General'</em> set the ```Bundle Identifier``` to the proper domain
* * Under <em>TARGETS->Runner->'Signing & Capabilities'</em> set the Provisioning Profile
* * Under <em>TARGETS->Runner->'Signing & Capabilities'</em> set the Development team
* * In the file view ```Pods/Podfile``` set the ```platform :ios, '12.4'``` (12.4 or earliest version being supported)
  ****