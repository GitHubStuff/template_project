// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../main/flavor_enum.dart';
import 'set_theme_dialog.dart';

/// This is a simple [Column widget template] with a collection of [Floating Action Buttons] that
/// is the parameter to the [Scaffold] in [app_scaffold_widget.dart template].
/// NOTE: this shows more examples of how, with [flutter_modular] to get [variables] that are
/// NOTE: defined a specific [Flavor] (eg: production, test, debug,...)

class FABWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    /// NOTE: example of creating a placeholder and getting a [ColorsForTheme] variable
    Color bulbColor = FlavorEnum.themeFabColor.themeColor;
    Color iconColor = FlavorEnum.themeFabIconColor.themeColor;

    return SpeedDial(
      animatedIcon: AnimatedIcons.list_view,
      closeManually: false,
      curve: Curves.bounceIn,
      heroTag: 'speed-dial-tag',
      backgroundColor: bulbColor,
      foregroundColor: iconColor,
      elevation: 8,
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.brightness_6,
              color: iconColor,
            ),
            backgroundColor: bulbColor,
            onTap: () {
              SetThemeDialog.show(context);
            })
      ],
    );
  }
}
