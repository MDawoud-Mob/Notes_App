import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/model/items.dart';

class DbHelper{

  static Database? _db ;


   Future<Database?> get db async {
   if(_db == null){
     _db = await _createDatabase();
     return _db;
   }else{
     return _db;
   }
  }

  _createDatabase() async{
    String path = join(await getDatabasesPath(), 'qlite.db');
    Database myDb = await openDatabase(path,version: 1, onCreate: _createDb);
    return myDb;
  }

   _createDb(Database db, int v) async{
    await db.execute('create table itemss(id integer primary key autoincrement,group text,type text,selling integer,buying integer,)');

  }

  Future<int> createCourse(Items items) async{
    Database? myDb = await db;
    return myDb!.insert('itemss', items.toMap());
  }


  Future<List> allCourses() async{
    Database? myDb = await db;
    return await  myDb!.query('itemss');
  }

  Future<int> delete(int id) async{
    Database? myDb = await db;
    return  myDb!.delete('itemss', where: 'id = ?', whereArgs: [id]);
  }


  Future<int> courseUpdate(Items items) async{
    Database? myDb = await db;
    return await  myDb!.update('itemss', items.toMap(),where: 'id = ?', whereArgs: [items.id]);
  }


}