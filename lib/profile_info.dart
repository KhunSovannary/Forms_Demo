import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

// ignore: must_be_immutable
class ProfileInfo extends StatefulWidget {
  String name;
  String age;
  String sex;
  String birthDate;
  String phoneNumber;
  File imageFile;
 ProfileInfo({this.name,this.age,this.sex,this.birthDate,this.phoneNumber,this.imageFile});
  @override
  _ProfileInfoState createState() {
    return _ProfileInfoState(name,age,sex,birthDate,phoneNumber,imageFile);
  }
}

class _ProfileInfoState extends State<ProfileInfo> {
  String name;
  String age;
  String sex;
  String birthDate;
  String phoneNumber;
  File imageFile;
  _ProfileInfoState(this.name,this.age,this.sex,this.birthDate,this.phoneNumber,this.imageFile);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(title: Text("Profile Information",),),
           body:   SingleChildScrollView(
                      child: Column(
                        children: <Widget> [
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                       image: FileImage(imageFile),
                                       fit: BoxFit.fill
                                    )),
                                       ),),),
                                   Container(
                                     margin: EdgeInsets.all(20),
                                     alignment: Alignment(-1,0.0),
                                     height: 20,
                                     child:Text('Name: $name', style: TextStyle(fontSize: 16.0,),),),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      alignment: Alignment(-1,0.0),
                                      height: 20,
                                      child:Text('Age: $age', style: TextStyle(fontSize: 16.0 ),),),
                                   Container(
                                     margin: EdgeInsets.all(20),
                                     alignment: Alignment(-1,0.0),
                                     height: 20,
                                     child:Text('Sex: $sex', style: TextStyle(fontSize: 16.0 ),),),
                                   Container(
                                     margin: EdgeInsets.all(20),
                                     alignment: Alignment(-1,0.0),
                                     height: 20,
                                     child:Text('BirthDate: $birthDate', style: TextStyle(fontSize: 16.0 ),),),
                                   Container(
                                     margin: EdgeInsets.all(20),
                                     alignment: Alignment(-1,0.0),
                                     height: 20,
                                     child:Text('PhoneNumber: $phoneNumber', style: TextStyle(fontSize: 16.0 ),),),


                         ],),
    ),
    );

  }
}
