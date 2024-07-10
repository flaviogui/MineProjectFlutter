import 'package:flutter/material.dart';
import 'package:funny_memes/components/bar.dart';
import "package:funny_memes/components/logoname.dart";
import 'components/mytextfield.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
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
          const Text(
            "LOGIN",
            style: TextStyle(fontSize: 25),
          ),
          const MyTextField(
            hint: "Usuário",
          ),
          const MyTextField(hint: "Senha"),
          OutlinedButton(
            onPressed: () => 1,
            child: Text("ENTRAR"),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Text.rich(TextSpan(children: [
                const TextSpan(text: 'NÃO TEM CONTA, CADASTRE '),
                WidgetSpan(
                    child: GestureDetector(
                  child: const Text(
                    "AQUI",
                    style: TextStyle(
                        color: Color(0xffff0000), fontWeight: FontWeight.bold),
                  ),
                  onTap: () => launchUrl(urlApi),
                ))
              ]))),
        ],
      ),
    );
  }
}
