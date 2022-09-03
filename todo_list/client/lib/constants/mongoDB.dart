import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:todo_list/constants/dbHelper.dart';

class MongoBD {
  static var db, informationCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    informationCollection = db.collection(INFORMATION_COLLECTION);
  }
}