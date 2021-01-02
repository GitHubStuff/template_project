import 'package:sqflite/sqflite.dart';
import 'package:sqlite_explorer/sqlite_explorer.dart';

import '../../modules/sql_controller_module/cubit/sqlite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sql_explorer_module.dart';

class SqlExplorerWidget extends ModularStatelessWidget<SqlExplorerModule> {
  static const String route = '/SqlExplorerWidget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite Explorer'),
      ),
      body: Center(
        child: _explore(),
      ),
    );
  }

  Widget _explore() {
    final sqliteCubit = Modular.get<SqliteCubit>();
    return Center(
      child: BlocProvider(
        create: (providerContext) => sqliteCubit,
        child: BlocBuilder<SqliteCubit, SqliteState>(builder: (_, state) {
          Database database;
          switch (state.sqliteState) {
            case SqliteStates.SqliteInitial:
              sqliteCubit.setUp();
              return Container(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              );
            case SqliteStates.SqliteReady:
              database = sqliteCubit.database();
              break;
          }
          return SqliteWidget(
            child: Center(child: Text('Huh?')),
            database: database,
          );
        }),
      ),
    );
  }
}
