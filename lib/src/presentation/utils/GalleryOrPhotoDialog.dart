

import 'package:flutter/material.dart';

GalleryOrPhotoDialog(BuildContext context, Function() pickImage, Function() TakePhoto){


  return showDialog(context: context, builder: (BuildContext context) => AlertDialog(
    actions: [
      ElevatedButton(onPressed: (){
        Navigator.pop(context);
        pickImage();
      }, child: Text("Galeria",
      style: TextStyle(
        color: Colors.black
      ),)),
      ElevatedButton(onPressed: (){
        Navigator.pop(context);
        TakePhoto();
      }, child: Text("Camera",
      style: TextStyle(
        color: Colors.black
      ),))
    ],
    
  ));
}