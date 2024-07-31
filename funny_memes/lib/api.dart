import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

final Api api = Api();

class Api {
  ValueNotifier<List> memes = ValueNotifier([{}]);
  ValueNotifier<String> urlEdit = ValueNotifier("");
  String jsonmeme = "";
  String choiceUrl = "";
  String apiUser = "";
  String apiPassword = "";
  int choiceX = 0;
  int choiceY = 0;
  int choiceBox = 0;
  String choiceId = "";

  Future<void> getMemes() async {
    Uri uriGet =
        Uri(scheme: "https", host: "api.imgflip.com", path: "get_memes");
    String jsonString = await http.read(uriGet);
    print(jsonString);
    var retorno = jsonDecode(jsonString);
    print(retorno["data"]["memes"]);
    memes.value = retorno["data"]["memes"];
  }

  Future<void> getPersonImage(List<Map> data) async {
    var url = Uri.https('api.imgflip.com', 'caption_image');
    var body = {
      'template_id': choiceId,
      'username': apiUser,
      'password': apiPassword,
      'text0': 'teste',
      'text1': 'tets',
    };
    for (int i = 0; i < data.length; i++) {
      print(data);
      print(i);
      body.addAll({
        'boxes[$i][text]': data[i]['text'],
        'boxes[$i][color]': data[i]['color'],
        'boxes[$i][outline_color]': data[i]['outline_color']
      });
      print("aaa");
      body.addAll({
        'boxes[$i][x]': data[i]['x'],
        'boxes[$i][y]': data[i]['y'],
      });
      print("aaaa");
      body.addAll({
        'boxes[$i][width]': data[i]['width'],
        'boxes[$i][height]': data[i]['height']
      });
      print('aaaaa');
    }
    print(body);
    jsonmeme = jsonEncode(body);
    var response = await http.post(url, body: body);
    var jsonString = jsonDecode(response.body);
    print(jsonString);
    urlEdit.value = jsonString['data']['url'];
  }

  Future<void> getImage(List<String> data) async {
    var url = Uri.https('api.imgflip.com', 'caption_image');
    var body = {
      'template_id': choiceId,
      'username': apiUser,
      'password': apiPassword,
      'text0': 'teste',
      'text1': 'tets',
    };
    for (int i = 0; i < data.length; i++) {
      body.addAll({
        'boxes[$i][text]': data[i].toUpperCase(),
      });
    }
    jsonmeme = jsonEncode(body);
    var response = await http.post(url, body: body);
    var jsonString = jsonDecode(response.body);
    print(jsonString);
    urlEdit.value = jsonString['data']['url'];
  }
}
