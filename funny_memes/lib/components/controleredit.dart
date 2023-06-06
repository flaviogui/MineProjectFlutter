import "package:flutter/material.dart";
import "editetxt.dart";

class ControlerEditText{
  var textColor =  0x000000;
  var textBorderColor =  0x000000;
  var posx = 0;
  var posy = 0;
  var textController = TextEditingController();
}

class ControlerEdit{
  final ValueNotifier<bool> person = ValueNotifier(false);
  final bottomControlerEdit = TextEditingController();
  bool edit = false;
  final topControlerEdit = TextEditingController();
  List<EditText> textController = [];
  static final ControlerEdit _instace = ControlerEdit._internal();

  factory ControlerEdit(){
    return _instace;
  }
  ControlerEdit._internal() {
    
  }

  void  reset(){
    person.value = false;
    bottomControlerEdit.text = '';
    edit = false;
    topControlerEdit.text = "";
    textController = [];
  }
}
