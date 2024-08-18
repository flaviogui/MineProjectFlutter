import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final Api api = Api();


class Api {
  ValueNotifier<List> memes = ValueNotifier([{}]);
  ValueNotifier<String> urlEdit = ValueNotifier("");
  Map<int,ValueNotifier<String>> memeshistory = {};
  ValueNotifier<int> lenghthistory = ValueNotifier(0);
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
    var retorno = jsonDecode(jsonString);
    memes.value = retorno["data"]["memes"];
  }


  Future<void> getPersonImage(List<Map> data) async {
    var url = Uri.https('api.imgflip.com', 'caption_image');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var datauser = prefs.getStringList('user');
    var apiUser = datauser?[0];
    var apiPassword = datauser?[1];
    print("chegou aqui image");
    var body = {
      'template_id': choiceId,
      'username': apiUser,
      'password': apiPassword,
      'text0': 'teste',
      'text1': 'tets',
    };
    print("chegou aqui image 2");
    for (int i = 0; i < data.length; i++) {
      body.addAll({
        'boxes[$i][text]': data[i]['text'],
        'boxes[$i][color]': data[i]['color'],
        'boxes[$i][outline_color]': data[i]['outline_color']
      });
      body.addAll({
        'boxes[$i][x]': data[i]['x'],
        'boxes[$i][y]': data[i]['y'],
      });
      body.addAll({
        'boxes[$i][width]': data[i]['width'],
        'boxes[$i][height]': data[i]['height']
      });
    }
    print("chegou aqui image 3");
    var response = await http.post(url, body: body);
    print("chegou aqui image fim");
    var jsonString = jsonDecode(response.body);
    print("tem condicao nao");
    body.addAll({
      'altura': api.choiceY.toString(),
      'largura': api.choiceX.toString(),
      'url': api.choiceUrl
    });
    jsonmeme = jsonEncode(body);
    print("url");
    print(jsonString);
    print(body);
    urlEdit.value = jsonString['data']['url'];
    print("fim da url");
  }

  Future<void> getImage(List<String> data) async {
    print("chegou aqui ue");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var datauser = prefs.getStringList('user');
    var apiUser = datauser?[0];
    var apiPassword = datauser?[1];
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
    var response = await http.post(url, body: body);
    var jsonString = jsonDecode(response.body);
    urlEdit.value = jsonString['data']['url'];
    body.addAll({
      'altura': api.choiceY.toString(),
      'largura': api.choiceX.toString(),
      'url': api.choiceUrl
    });
    jsonmeme = jsonEncode(body);
  }
   Future<void> getPersonImageHistory(List<Map> data,imageId,pos) async {
    var url = Uri.https('api.imgflip.com', 'caption_image');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var datauser = prefs.getStringList('user');
    var apiUser = datauser?[0];
    var apiPassword = datauser?[1];
    print("chegou aqui image");
    var body = {
      'template_id': imageId,
      'username': apiUser,
      'password': apiPassword,
      'text0': 'teste',
      'text1': 'tets',
    };
    print("chegou aqui image 2");
    for (int i = 0; i < data.length; i++) {
      body.addAll({
        'boxes[$i][text]': data[i]['text'],
        'boxes[$i][color]': data[i]['color'],
        'boxes[$i][outline_color]': data[i]['outline_color']
      });
      body.addAll({
        'boxes[$i][x]': data[i]['x'],
        'boxes[$i][y]': data[i]['y'],
      });
      body.addAll({
        'boxes[$i][width]': data[i]['width'],
        'boxes[$i][height]': data[i]['height']
      });
    }
    print("chegou aqui image 3");
    var response = await http.post(url, body: body);
    print("chegou aqui image fim");
    var jsonString = jsonDecode(response.body);
    print("tem condicao nao");
    body.addAll({
      'altura': api.choiceY.toString(),
      'largura': api.choiceX.toString(),
      'url': api.choiceUrl
    });
    jsonmeme = jsonEncode(body);
    print("url");
    print(jsonString);
    print(body);
    memeshistory[pos] = (ValueNotifier(jsonString['data']['url']));
    lenghthistory.value++;
    print("fim da url");
  }

  Future<void> getImageHistory(List<String> data,imageId,pos) async {
    print("chegou aqui ue");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var datauser = prefs.getStringList('user');
    var apiUser = datauser?[0];
    var apiPassword = datauser?[1];
    var url = Uri.https('api.imgflip.com', 'caption_image');
    var body = {
      'template_id': imageId,
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
    var response = await http.post(url, body: body);
    var jsonString = jsonDecode(response.body);
    print(body);
    memeshistory[pos] = (ValueNotifier(jsonString['data']['url']));
    lenghthistory.value++;
    body.addAll({
      'altura': api.choiceY.toString(),
      'largura': api.choiceX.toString(),
      'url': api.choiceUrl
    });
    jsonmeme = jsonEncode(body);
  }
}
