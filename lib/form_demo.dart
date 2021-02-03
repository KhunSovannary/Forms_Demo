
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class FormsDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormsDemoState();}
}

class FormsDemoState extends State<FormsDemo> {
  final _picker = ImagePicker();
  PickedFile _imageFile;
  String _name;
  String _age;
  String _sex;
  String _birthDate;
  String _phoneNumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildProfilePic()
  {
    return Center(
      child: Stack(children: <Widget>[
      CircleAvatar(
        radius: 60.0,
        backgroundImage: FileImage(File(_imageFile.path)),
      ),
      Positioned(
        bottom: 10.0,
        right: 45.0,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
            );
          },
          child: Icon(
          Icons.camera_alt,
          color:Colors.teal,
          size:30.0,
        ),
          )
      ),
      ]),
    );
  }
  void takePhoto(ImageSource source) async {
      final pickedFile = await _picker.getImage(
      source: source);
      setState(() {
        _imageFile = pickedFile;});
  }
  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Select Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: (){
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),)
          ])
        ]
      )
    );
  }
  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      keyboardType: TextInputType.text,
      // ignore: missing_return
      validator: (String value){
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      onSaved: (String value){
        _name = value;
      },
    );
  }
  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age',),
      keyboardType: TextInputType.number,
      // ignore: missing_return
      validator: (String value){
        if (value.isEmpty) {
          return 'Age is Required';
        }
      },
      onSaved: (String value){
        _age = value;
      },
    );
  }
  Widget _buildSex() {
    return TextFormField(
      decoration: InputDecoration(labelText:'Sex',),
      keyboardType: TextInputType.text,
      // ignore: missing_return
      validator: (String value){
        if (value.isEmpty) {
          return 'Sex is Required';
        }
      },
      onSaved: (String value){
        _sex = value;
      },
    );
  }
  Widget _buildBirthDate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Birth Date'),
      keyboardType: TextInputType.datetime,
      // ignore: missing_return
      validator: (String value){
        if (value.isEmpty) {
          return 'Birth Date is Required';
        }
      },
      onSaved: (String value){
        _birthDate = value;
      },
    );
  }
  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      keyboardType: TextInputType.phone,
      // ignore: missing_return
      validator: (String value){
        if (value.isEmpty) {
          return 'Phone Number is Required';
        }
      },
      onSaved: (String value){
        _phoneNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Form Demo"),),
        body: SingleChildScrollView( child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SingleChildScrollView(
                            child: Column(
                            children: <Widget> [
                                    _buildProfilePic(),
                                    _buildName(),
                                    _buildAge(),
                                    _buildSex(),
                                    _buildBirthDate(),
                                    _buildPhoneNumber(),
                                    SizedBox(height: 100),
                                    RaisedButton(
                                       child: Text('Submit',
                                       style: TextStyle(color: Colors.blue, fontSize: 16),
                                       ),
                                       onPressed:() {
                                       if(!_formKey.currentState.validate()){
                                       return;
                                        }
                                       _formKey.currentState.save();
                                       print(_name);
                                       print(_age);
                                       print(_sex);
                                       print(_birthDate);
                                       print(_phoneNumber);
                                    },
                                  )
                                ],
                              ),
                            ),
                           ],
                          ),
                          ),
                      ),)
                      ) ;
                    }
}