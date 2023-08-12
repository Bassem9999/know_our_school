import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:know_our_school/Model/model.dart';
import 'package:know_our_school/repositories/repo_api.dart';

class SchoolViewModel extends ChangeNotifier{

List dataList = [];

showData()async{
  dataList = await RepositoriesApi().getData();
 // dataList = responsebody; 
  print('show');
  notifyListeners();
  print(dataList);
   return dataList;
}

hideData(){
  dataList.clear();
  print("hide");
  notifyListeners();
}
}

