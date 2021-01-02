import 'package:sqflite/sqflite.dart';
import 'package:sqlite_package/sqlite_package.dart' as SQL;

import '../../../main/flavor_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:theme_package/theme_package.dart';

part 'sqlite_state.dart';

class SqliteCubit extends Cubit<SqliteState> {
  SqliteCubit() : super(SqliteInitial());

  void setUp() async {
    await SQL.SqliteController.initialize(name: FlavorConfig.string(key: FlavorEnum.databaseName.key));
    await Future.delayed(Duration(milliseconds: 300));
    emit(SqliteReady());
  }

  Database database() {
    return SQL.SqliteController.database;
  }
}
