import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/model.dart';
import '../ViewModel/view_model.dart';

class SchoolInfo extends StatelessWidget {
  SchoolInfo({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    void eat(){
      print("eat");
    }
    return ChangeNotifierProvider(
      create: ((context) => SchoolViewModel()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color(0xff477B71),
          leading: const Icon(Icons.menu, size: 30,),
          title: const Text(
            'School Info',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
          ),
        ),
        body: Consumer<SchoolViewModel>(
          builder: ((context, model, child) {
             String schoolName = model.dataList.isEmpty? "School Name" : model.dataList[0]['School Name'];
             String schoolAddress = model.dataList.isEmpty? "School Address" : model.dataList[0]['School Address'];
             String studentsNo = model.dataList.isEmpty? "Number of Students" : model.dataList[0]['Number of Students'];
             String teachersNo = model.dataList.isEmpty? "Number of Teachers" : model.dataList[0]['Number of Teachers'];
            return    SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only( top: 20),
                  child: Image.asset('assets/images/school.png', width:250,),
                ),
                reusableTextField(schoolName, Icons.school),
                const SizedBox(height: 15,),
                reusableTextField(schoolAddress, Icons.location_on_rounded),
                const SizedBox(height: 15,),
                reusableTextField(studentsNo, Icons.person),
                const SizedBox(height: 15,),
                reusableTextField(teachersNo, Icons.person),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Container(
                      width: 300,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 1),
                              blurRadius: 12.0)
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                        color: const Color(0xffe9b637) ,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ButtonTheme(
                          minWidth: 300,
                          child: TextButton(
                            onPressed: () {
                              //TODO Call your function to load the school data
                              //TODO: Hint: Replace the class attributes with the data fetched from the JSON file
                              
                           model.dataList.isEmpty?model.showData():model.hideData();
                            },
                            child: Text(
                                 model.dataList.isEmpty?'Show Data':'Hide Data',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
          }),
       
        ),
      ),
    );
  }

  Widget reusableTextField(String text, IconData iconShape) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffd3d3d3),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child:
        Row(
          children: [
            const SizedBox(width: 10,),
            Icon(iconShape, color: Colors.white,size: 35,),
            const SizedBox(width: 10,),
            Text(text,style: const TextStyle(color: Colors.white, fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
