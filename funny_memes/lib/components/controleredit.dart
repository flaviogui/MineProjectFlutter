import "package:flutter/material.dart";
import "editetxt.dart";

class ControlerEdit {
  final ValueNotifier<bool> person = ValueNotifier(false);
  final bottomControlerEdit = TextEditingController();
  bool edit = false;
  bool recovery = false;
  final topControlerEdit = TextEditingController();
  List<TextEditingController> textsNormal = [];
  List<EditText> textController = [];
  List<EditTextControler> textEditsValue = [];
  static final ControlerEdit _instace = ControlerEdit._internal();

  factory ControlerEdit() {
    return _instace;
  }
  ControlerEdit._internal();

  ControlerEdit.kk();

  void reset() {
    recovery = false;
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
