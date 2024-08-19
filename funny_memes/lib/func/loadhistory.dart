import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api.dart';
import 'dart:convert';
import '../components/controleredit.dart';
import '../components/editetxt.dart';

Future<void> loadHistory(int pos) async{
  var value = await SharedPreferences.getInstance();
  var history = value.getStringList('history')?[pos];
  var date = jsonDecode(history ?? "");
  print("date:$date");
  List<Map<String, dynamic>> fields = [{}];
  final Map<String,dynamic> fieldsMap = {
        "template_id": (key) => api.choiceId = date[key],
        "url": (key) => api.choiceUrl = date[key],
        "altura":(key) => api.choiceY = int.parse(date[key]),
        "largura":(key) => api.choiceX = int.parse(date[key]),
  };
  int boxes = 0;
  bool person = false;
  print("inicio");
  date.forEach((key,val){
    print("key:$key");
    fieldsMap.forEach((k, value) {
      if(key == k){
        print("acho que aqui");
        value(key);
        print("k:$k e value:$key");
      }
    });
    if (key.contains("boxes[${(boxes + 1).toString()}]")) {
      boxes++;
      print("boxes: $boxes");
      fields.add({});
    }
    if(key.contains("boxes[${(boxes).toString()}]")){
      var noBoxesInit = key.lastIndexOf('[');
      String noBoxString = key.substring(noBoxesInit+1,key.length-1);
      print("noboxstring: $noBoxString");
      fields[boxes][noBoxString] = val;
    }
  });
  print("em busca do erro:3");
  var controler = ControlerEdit();
  controler.reset();
  if (fields[0].keys.length > 1){
    person = true;
    controler.person.value = true;
  }
  controler.recovery = true;
  print("person:$person");
  print("id:${api.choiceId}");
  print("url:${api.choiceUrl}");
  print("fields:$fields");
  int textIndex = 0;
  print("alo");
  if(person){
    print("entrou?");
    for(var e in fields){
      print("personalizado");
      e["color"] = "0x${e["color"].substring(1)}";
      e["outline_color"] = "0x${e["outline_color"].substring(1)}";
      controler.textController.add(EditText());
      controler.textController[textIndex].alter(
        EditTextControler(
          e["text"],
          int.tryParse(e["x"]) ?? 1,
          int.tryParse(e["y"]) ?? 1,
          int.tryParse(e["outline_color"]) ?? 1,
          int.tryParse(e["color"]) ?? 1,
          int.tryParse(e["height"]) ?? 1,
          int.tryParse(e["width"]) ?? 1));
          print("criado box");
          textIndex++;
    }
      api.getPersonImage(controler.textController
          .map((value) => value.control.toMap())
          .toList());
  }else{
    print("normal");
    api.choiceBox = boxes+1;
    for(var e in fields){
      controler.addNormalText(TextEditingController(text:e["text"]));
      print("adicionado normal");
      textIndex++;
    }
    api.getImage(controler.textsNormal
          .map((value) => value.text)
          .toList());
  }
  controler.edit = true;
  print("kkk");
}



loadALL(){
  SharedPreferences.getInstance().then((value) async {
    var g = value.getStringList("history") ?? [];
    api.memes.value = [];
    api.lenghthistory.value = 0;
    for(int c = 0;c < g.length;c++){
        await loadHistoryKK(c);
    }
    });
}


Future<void> loadHistoryKK(int pos) async{
  var value = await SharedPreferences.getInstance();
  var history = value.getStringList('history')?[pos];
  var date = jsonDecode(history ?? "");
  print("date:$date");
  List<Map<String, dynamic>> fields = [{}];
  final Map<String,dynamic> fieldsMap = {
        "template_id": (key) => api.choiceId = date[key],
        "url": (key) => api.choiceUrl = date[key],
        "altura":(key) => api.choiceY = int.parse(date[key]),
        "largura":(key) => api.choiceX = int.parse(date[key]),
  };
  int boxes = 0;
  bool person = false;
  print("inicio");
  date.forEach((key,val){
    print("key:$key");
    fieldsMap.forEach((k, value) {
      if(key == k){
        print("acho que aqui");
        value(key);
        print("k:$k e value:$key");
      }
    });
    if (key.contains("boxes[${(boxes + 1).toString()}]")) {
      boxes++;
      print("boxes: $boxes");
      fields.add({});
    }
    if(key.contains("boxes[${(boxes).toString()}]")){
      var noBoxesInit = key.lastIndexOf('[');
      String noBoxString = key.substring(noBoxesInit+1,key.length-1);
      print("noboxstring: $noBoxString");
      fields[boxes][noBoxString] = val;
    }
  });
  print("em busca do erro:3");
  var controler = ControlerEdit.kk();
  controler.reset();
  if (fields[0].keys.length > 1){
    person = true;
    controler.person.value = true;
  }
  controler.recovery = true;
  print("person:$person");
  print("id:${api.choiceId}");
  print("url:${api.choiceUrl}");
  print("fields:$fields");
  int textIndex = 0;
  print("alo");
  if(person){
    print("entrou?");
    for(var e in fields){
      print("personalizado");
      e["color"] = "0x${e["color"].substring(1)}";
      e["outline_color"] = "0x${e["outline_color"].substring(1)}";
      controler.textController.add(EditText());
      controler.textController[textIndex].alter(
        EditTextControler(
          e["text"],
          int.tryParse(e["x"]) ?? 1,
          int.tryParse(e["y"]) ?? 1,
          int.tryParse(e["outline_color"]) ?? 1,
          int.tryParse(e["color"]) ?? 1,
          int.tryParse(e["height"]) ?? 1,
          int.tryParse(e["width"]) ?? 1));
          print("criado box");
          textIndex++;
    }
      api.getPersonImageHistory(controler.textController
          .map((value) => value.control.toMap())
          .toList(),date["template_id"],pos);
  }else{
    print("normal");
    api.choiceBox = boxes+1;
    for(var e in fields){
      controler.addNormalText(TextEditingController(text:e["text"]));
      print("adicionado normal");
      textIndex++;
    }
    api.getImageHistory(controler.textsNormal
          .map((value) => value.text)
          .toList(),date["template_id"],pos);
  }
  controler.edit = true;
  print("kkk");
}