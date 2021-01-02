// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.

import 'package:Template/modules/sql_controller_module/sql_controller_widget.dart';
import 'package:Template/modules/sql_explorer_module/sql_explorer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main/flavor_enum.dart';

/// This is a template of what the widget below [MaterialApp] and [ScaffoldApp] would be, with an example of
/// how to get a value for configuration [Flavor]. 'textStyle': is defined in the [Main.dart]
/// as a variable that can be specific to a [Flavor]
///
class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// NOTE: Example of getting [variable] of a given [Flavor]
    TextStyle textStyle = FlavorEnum.textStyle.style;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'AT THE CENTER',
        ),
        Text(
          'This is custom style',
          style: textStyle,
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.database, size: 40),
          onPressed: () {
            Modular.to.pushNamed(SqlControllerWidget.route);
          },
        ),
        SizedBox(height: 20),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.telescope, size: 40),
          onPressed: () {
            Modular.to.pushNamed(SqlExplorerWidget.route);
          },
        ),
      ],
    ));
  }
}
