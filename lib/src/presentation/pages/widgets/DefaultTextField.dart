import 'package:flutter/material.dart';

class Defaulttextfield extends StatelessWidget {

  final String text;
  final Function(String text) onChange;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final String? Function(String?)? validator;
  final Color backgroudColor;

  const Defaulttextfield({
  super.key,
  required this.text,
  required this.icon,
  required this.onChange,
  this.margin = const EdgeInsets.only(top: 50,left: 20,right: 20), 
  this.validator,
  this.backgroudColor =Colors.white

  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: margin,
                decoration: BoxDecoration(
                  color: backgroudColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: TextFormField(
                  onChanged: (text){
                    onChange(text);
                  },validator: validator ,
                  decoration: InputDecoration(
                    label: Text(text),
                    border: InputBorder.none,
                    prefixIcon: Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Icon(icon ),
                          Container(height: 20, width: 1, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}