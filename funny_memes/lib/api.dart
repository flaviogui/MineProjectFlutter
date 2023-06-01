import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

final ValueNotifier<Api> api = ValueNotifier(Api());

class Api{
  List<dynamic> memes = [];
  String choiceUrl = "";
  String choiceId = "";
  
  Future<void> getMemes() async{
    Uri uriGet = Uri(
      scheme:"https",
      host:"api.imgflip.com",
      path:"get_memes"
    );
    String jsonString = await http.read(uriGet);
    print(jsonString); 
    var retorno = jsonDecode(jsonString);
    memes = retorno["data"]["memes"];
  }

}
