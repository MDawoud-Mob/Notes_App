import 'package:flutter/material.dart';
import 'package:sqlite/model/items.dart';
import '../sqlite/dbhelper.dart';


class MyProvider extends ChangeNotifier {

   final DbHelper _helper  = DbHelper();
   var allCourses = [];
   var filteredCourse = [];
  Items _items =  Items.init();


  Items get items => _items;

  void setCourse(  Items items ){
    _items = items;
  }

  void getCourses() {
     _helper.allCourses().then((itemss){
         allCourses = itemss;
         filteredCourse = allCourses;
     });
     notifyListeners();
   }


   Future<int> deleteCourse(int id) async{
     return await _helper.delete(id);
   }

   Future<int> updateCourse(Items items) async{
     return await  _helper.courseUpdate(items);
   }


   Future<int> insertCourse(Items items) async{
      return await _helper.createCourse(items);
   }




}