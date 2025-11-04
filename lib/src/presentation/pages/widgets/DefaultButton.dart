import 'package:flutter/material.dart';

class Defaultbutton extends StatelessWidget {

  final String? texto;
  final Color? color;
  final Function()  onPressed;

  const Defaultbutton({super.key,
  required this.onPressed, 
  this.texto = "Boton",
  this.color =Colors.amber,});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                // alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    onPressed();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    texto!,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
  }
}