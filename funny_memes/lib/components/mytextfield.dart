import "package:flutter/material.dart";

class MyTextField extends StatelessWidget{
  final TextEditingController? controler;
  final String? hint;
  const MyTextField({super.key,this.controler,this.hint});

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(5),
      child:TextField(
        controller:controler,
        decoration:InputDecoration(
            hintText:hint,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))
            )
        )
      )
    );
  }
}
