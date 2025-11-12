import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {

  final Color color;
  final EdgeInsetsGeometry? margin;
  
   DefaultIconBack({
    this.color = Colors.white,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: margin,
      child:
       IconButton(
        onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back), 
        iconSize: 35,
        color: color,),
    );
  }
}