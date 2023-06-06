import "package:flutter/material.dart";

class MyTextField extends StatelessWidget{
  final controler;
  final hint;
  const MyTextField({super.key,this.controler,this.hint});

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding:EdgeInsets.all(5),
      child:TextField(
        controller:controler,
        decoration:InputDecoration(
            hintText:hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))
            )
        )
      )
    );
  }
}
