import "package:flutter/material.dart";
import "../api.dart";



class EditText extends StatefulWidget{
  final controler =  TextEditingController();
  final control = EditTextControler('',0,0,0x000000,0x000000,0,0);
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
      height:450,
      width:300,
      padding:EdgeInsets.all(4),
      margin:EdgeInsets.all(4),
      child:Column(
        children: [
          TextField(
            controller:widget.controler,
            onChanged:(str){
                setState((){
                  widget.control.text = str;
                });
            },
            decoration:InputDecoration(
            hintText:'insira o texto aqui',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))
            )
        )
          ),
          Slider(
            value:widget.control.widht.toDouble(),
            divisions:api.choiceX,
            min:0,
            max:api.choiceX.toDouble(),
            label:"largura: ${widget.control.widht} ",
            onChanged:(value){
              setState((){
                widget.control.widht = value.toInt();
              });
            }
          ),
          Slider(
            value:widget.control.posX.toDouble(),
            divisions:api.choiceX,
            min:0,
            max:api.choiceX.toDouble(),
            label:"posição X: ${widget.control.posX} ",
            onChanged:(value){
              setState((){
                widget.control.posX = value.toInt();
              });
            }
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns:1,
                child:
                    Slider(
                      value:widget.control.posY.toDouble(),
                      divisions:api.choiceY,
                      min:0,
                      max:api.choiceY.toDouble(),
                      label:"posição Y: ${widget.control.posY} ",
                      onChanged:(value){
                        setState((){
                          widget.control.posY = value.toInt();
                        });
                      }
                    ),
                ),
                RotatedBox(
                quarterTurns:1,
                child:
                    Slider(
                      value:widget.control.height.toDouble(),
                      divisions:api.choiceY,
                      min:0,
                      max:api.choiceY.toDouble(),
                      label:"altura: ${widget.control.height} ",
                      onChanged:(value){
                        setState((){
                          widget.control.height = value.toInt();
                        });
                      }
                    ),
                ),
            ],
          ),
          Slider(
            activeColor: Color(widget.control.textColor+0xff000000),
            value:widget.control.textColor.toDouble(),
            min:0x000000,
            max:0xffffff,
            divisions:0xffffff,
            label:"cor do texto: ${widget.control.textColor.toRadixString(16)}",
            onChanged:(value){
              setState((){
                widget.control.textColor = value.toInt();
              });
            }
          ),
          Slider(
            activeColor: Color(widget.control.borderColor+0xff000000),
            value:widget.control.borderColor.toDouble(),
            min:0x000000,
            max:0xffffff,
            divisions:0xffffff,
            label:"cor da borda:${widget.control.borderColor.toRadixString(16)}",
            onChanged:(value){
              setState((){
                widget.control.borderColor = value.toInt();
              });
            }
          )
        ]
      )
    );
  }
}

class EditTextControler{
  String text;
  int posX;
  int posY;
  int borderColor;
  int textColor;
  int widht;
  int height;
  EditTextControler(this.text, this.posX, this.posY, this.borderColor, this.textColor,this.height,this.widht);

  Map toMap(){
    return {'text':text,'x':posX.toString(),'y':posY.toString(),'color':'#${textColor.toRadixString(16)}','outline_color':'#${borderColor.toRadixString(16)}','width':widht.toString(),'height':height.toString()};
  }
}
