import 'package:flutter/foundation.dart';
import 'package:mobile_finus_ai_codenox/app/data/models/auth/login_model.dart';
import 'package:mobile_finus_ai_codenox/app/domain/entities/user.dart';
import 'package:mobile_finus_ai_codenox/core/helper/database_helper.dart';
import 'package:mobile_finus_ai_codenox/core/util/security.dart';
import 'package:sqflite/sqflite.dart';

class UserDb {
  UserDb._privateConstructor();

  static final UserDb instance = UserDb._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await DatabaseHelper.instance.database;
    return _database;
  }

  Future<int?> insertUser(User user) async {
    Database? db = await instance.database;
    await deleteUser();
    return await db?.insert(
      DatabaseHelper.tableUsers,
      await user.toDb(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int?> updateUsers(User user) async {
    Database? db = await instance.database;
    String userId = Security.encryptAes(user.userId.toString()) ?? '';

    try {
      return await db?.update(
        DatabaseHelper.tableUsers,
        await user.toDb(),
        where: 'userId = ?',
        whereArgs: [userId],
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error Update : $e');
      }
      return null;
    }
  }

  Future<int?> deleteUser() async {
    Database? db = await instance.database;
    return await db?.delete(DatabaseHelper.tableUsers);
  }

  Future<User?> getUser() async {
    try {
      Database? db = await instance.database;
      var result = await db?.query(DatabaseHelper.tableUsers, limit: 1);

      if (result != null && result.isNotEmpty) {
        return await User.fromDb(result[0]);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
