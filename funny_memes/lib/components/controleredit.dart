import "package:flutter/material.dart";
import "editetxt.dart";

class ControlerEdit {
  final ValueNotifier<bool> person = ValueNotifier(false);
  final bottomControlerEdit = TextEditingController();
  bool edit = false;
  final topControlerEdit = TextEditingController();
  List<TextEditingController> textsNormal = [];
  List<EditText> textController = [];
  List<EditTextControler> textEditsValue = [];
  static final ControlerEdit _instace = ControlerEdit._internal();

  factory ControlerEdit() {
    return _instace;
  }
  ControlerEdit._internal();

  void reset() {
    textsNormal = [];
    person.value = false;
    bottomControlerEdit.text = '';
    edit = false;
    topControlerEdit.text = "";
    textController = [];
  }

  void addNormalText(TextEditingController text) {
    textsNormal.add(text);
  }
}
