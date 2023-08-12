//TODO: add your view model class here
//TODO: add your model class here

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SchoolModel{
  String? school_name;
  String? school_address;
  String? numberOfStudents;
  String? numberOfTeachers;

  SchoolModel({this.school_name,this.school_address,this.numberOfStudents,this.numberOfTeachers});
  SchoolModel.fromJson(Map<String,dynamic> json){
    school_name = json['School Name'];
    school_address = json['School Address'];
    numberOfStudents = json['Number of Students'];
    numberOfTeachers = json['Number of Teachers'];
  }

  Map<String,dynamic> toJson(){
    return {'School Name':school_name, 'School Address':school_address, 'Number of Students':numberOfStudents,'Number of Teachers':numberOfTeachers};
  }



}























