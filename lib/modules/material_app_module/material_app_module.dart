// Copyright 2020 LTMM. All rights reserved.
// Uses of this source code is governed by 'The Unlicense' that can be
// found in the LICENSE file.
import 'package:Template/modules/sql_explorer_module/sql_explorer_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_package/theme_package.dart';

import 'material_app_bloc.dart';
import 'material_app_widget.dart';

import '../../modules/sql_controller_module/sql_controller_module.dart';
import '../../modules/sql_controller_module/sql_controller_widget.dart';
import '../../modules/sql_explorer_module/sql_explorer_widget.dart';
import '../app_scaffold_module/app_scaffold_module.dart';

/// Per flutter_modular this is the root/top of the Module for an app.
/// This module sets critial Binds:
/// -- [MaterialAppModule] for memory management
/// -- [FlavorConfig] that has themes, properties, etc for specific app flavors (release, debug, test,...)
/// The root/parent module is [AppScaffoldModule] that, in addition to other Bloc duties, points to the
/// first/root widget of the application
class MaterialAppModule extends MainModule {
  final FlavorConfig flavorConfig;
  MaterialAppModule({@required this.flavorConfig}) : assert(flavorConfig != null);

  @override
  List<Bind> get binds => [
        //Bind((i) => AppModule(flavorConfig: flavorConfig)),
        Bind((i) => MaterialAppWidget()),
        Bind((i) => flavorConfig),
        Bind((i) => Log.setTrace(baseLevel: flavorConfig.startingLogLevel), lazy: false),
        Bind((i) => MaterialAppBloc()),
        Bind((i) => ThemeCubit()),

        /// TODO: Additional Bind beyond the template
      ];

  @override
  Widget get bootstrap => MaterialAppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Navigator.defaultRouteName, module: AppScaffoldModule()),
        ModularRouter(SqlControllerWidget.route, module: SqlControllerModule()),
        ModularRouter(SqlExplorerWidget.route, module: SqlExplorerModule()),
      ];
}
