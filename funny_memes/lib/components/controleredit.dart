import "package:flutter/material.dart";
import "editetxt.dart";

class ControlerEdit {
  final ValueNotifier<bool> person = ValueNotifier(false);
  final bottomControlerEdit = TextEditingController();
  bool edit = false;
  final topControlerEdit = TextEditingController();
  List<EditText> textController = [];
  List<EditTextControler> textEditsValue = [];
  static final ControlerEdit _instace = ControlerEdit._internal();

  factory ControlerEdit() {
    return _instace;
  }
  ControlerEdit._internal() {}

  void reset() {
    person.value = false;
    bottomControlerEdit.text = '';
    edit = false;
    topControlerEdit.text = "";
    textController = [];
  }
}
