import "package:flutter/material.dart";
import "mytextfield.dart";


class EditText extends StatefulWidget{
  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context){
    return Container(
      decoration:BoxDecoration(
        border:Border.all()
      ), 
      height:350,
      width:300,
      padding:EdgeInsets.all(4),
      margin:EdgeInsets.all(4),
      child:Column(
        children: [
          MyTextField(
            hint:"insira o texto aqui",
            controler:TextEditingController()
          ),
          Slider(
            value:1,
            min:0,
            max:100,
            label:"posicao x",
            onChanged:(value){}
          ),
          Slider(
            value:1,
            min:0,
            max:100,
            label:"posicao y",
            onChanged:(value){}
          ),
          Slider(
            value:0x000000,
            min:0x000000,
            max:0xffffff,
            label:"cor do texto",
            onChanged:(value){
              setState((){
                
              });
            }
          ),
          Slider(
            value:1,
            min:0,
            max:100,
            label:"cor da borda",
            onChanged:(value){}
          )
        ]
      )
    );
  }
}
