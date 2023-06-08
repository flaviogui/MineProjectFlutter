import "package:flutter/material.dart";
import "../api.dart";
import "mytextfield.dart";

class EditText extends StatefulWidget {
  final controler = TextEditingController();
  final control = EditTextControler('', 0, 0, 0x000000, 0x000000);
  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all()),
        height: 350,
        width: 300,
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(4),
        child: Column(children: [
          MyTextField(hint: "insira o texto aqui", controler: widget.controler),
          Slider(
              value: widget.control.posX.toDouble(),
              divisions: 100,
              min: 0,
              max: api.choiceX.toDouble(),
              label: "posição X: ${widget.control.posX} ",
              onChanged: (value) {
                setState(() {
                  widget.control.text = widget.controler.text;
                  widget.control.posX = value.toInt();
                });
              }),
          Slider(
              value: widget.control.posY.toDouble(),
              divisions: 100,
              min: 0,
              max: api.choiceY.toDouble(),
              label: "posição Y: ${widget.control.posY} ",
              onChanged: (value) {
                setState(() {
                  widget.control.text = widget.controler.text;
                  widget.control.posY = value.toInt();
                });
              }),
          Slider(
              activeColor: Color(widget.control.textColor + 0xff000000),
              value: widget.control.textColor.toDouble(),
              min: 0x000000,
              max: 0xffffff,
              divisions: 0xffffff,
              label:
                  "cor do texto: ${widget.control.textColor.toRadixString(16)}",
              onChanged: (value) {
                setState(() {
                  widget.control.text = widget.controler.text;
                  widget.control.textColor = value.toInt();
                });
              }),
          Slider(
              activeColor: Color(widget.control.borderColor + 0xff000000),
              value: widget.control.borderColor.toDouble(),
              min: 0x000000,
              max: 0xffffff,
              divisions: 0xffffff,
              label:
                  "cor da borda:${widget.control.borderColor.toRadixString(16)}",
              onChanged: (value) {
                setState(() {
                  widget.control.text = widget.controler.text;
                  widget.control.borderColor = value.toInt();
                });
              })
        ]));
  }
}

class EditTextControler {
  String text;
  int posX;
  int posY;
  int borderColor;
  int textColor;
  EditTextControler(
      this.text, this.posX, this.posY, this.borderColor, this.textColor);

  Map toMap() {
    return {
      'text': text,
      'x': posX.toString(),
      'y': posY.toString(),
      'color': '#${textColor.toRadixString(16)}',
      'outline_color': '#${borderColor.toRadixString(16)}'
    };
  }
}
