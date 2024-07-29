import 'package:flutter/material.dart';
import 'package:funny_memes/components/bar.dart';
import "package:funny_memes/components/logoname.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'components/mytextfield.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Uri urlApi = Uri.parse("https://imgflip.com/");
    return Scaffold(
      appBar: const MyBar(
        home: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LogoName(
            nameSize: 25,
            name: "LOGIN",
            time: Duration.zero,
          ),
          MyTextField(
            hint: "Usuário",
            controler: user,
          ),
          MyTextField(
            hint: "Senha",
            controler: password,
          ),
          OutlinedButton(
            onPressed: () async {
              var url = Uri.https('api.imgflip.com', 'caption_image');
              var body = {
                'template_id': "181913649",
                'username': user.text,
                'password': password.text,
                'text0': 'teste',
                'text1': 'tets',
              };
              var response = await http.post(url, body: body);
              var jsonString = jsonDecode(response.body);
              print("erro t5eachei");
              if (jsonString['success'] == true) {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                print(await prefs
                    .setStringList('user', [user.text, password.text]));
              }
            },
            child: Text("ENTRAR"),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Text.rich(TextSpan(children: [
                const TextSpan(text: 'NÃO TEM CONTA, CADASTRE '),
                WidgetSpan(
                    child: GestureDetector(
                  child: const LogoName(
                    name: "AQUI",
                    nameSize: 16,
                    time: Duration.zero,
                  ),
                  onTap: () => launchUrl(urlApi),
                ))
              ]))),
        ],
      ),
    );
  }
}
