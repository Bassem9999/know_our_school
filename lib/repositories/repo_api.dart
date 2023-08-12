import 'dart:convert';

import 'package:flutter/services.dart';

import '../Model/model.dart';

class RepositoriesApi{
  Future<List<SchoolModel>> getData()async{
  var data = "lib/JSONdata/SchoolData.json";
  var response = await rootBundle.loadString(data);
  var responsebody = jsonDecode(response);
  var myData = responsebody.map((item)=>SchoolModel.fromJson(item)).toList();
 // dataList = responsebody; 
  print('show');
  print(myData);
  return myData;
}
}