import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahool/utils/theme.dart';
openImagePicker(BuildContext context,Function onImageSelected) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                'Pick an image',
                style: TextStyle(
                  color: primary,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Expanded(
                  child:  FlatButton(
                    color: primary,
                    child: Text('Use Camera',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      getImage(context, ImageSource.camera,onImageSelected);
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FlatButton(
                    color: primary,
                    child: Text('Use Gallery',style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      getImage(context, ImageSource.gallery,onImageSelected);
                    },
                  ),
                )
              ],)
            ],
          ),
        );
      });
}
getImage(BuildContext context, ImageSource source,Function onImageSelected) async{
  try {
    final pickedImageFile = await ImagePicker.pickImage(source: source,imageQuality: 50);
    onImageSelected(pickedImageFile);
    Navigator.pop(context);
    // ImagePicker.pickImage(source: source, imageQuality: 50).then((File file) {
    //
    // });
  }catch(e){

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Allow access'),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}