import "package:flutter/material.dart";
import "package:funny_memes/components/logoname.dart";
import "components/bar.dart";
import 'package:url_launcher/url_launcher.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});
  static Uri urlFlavio = Uri.parse("https://github.com/kolitero");
  static Uri urlIsayan =
      Uri(host: "github.com", path: "kolitero", scheme: "https");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyBar(
        home: false,
      ),
      body: Column(children: [
        const Center(
          child: LogoName(
            name: "INFORMAÇÕES SOBRE O PROJETO",
            nameSize: 32,
            time: Duration.zero,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Hero(
            tag: "assd",
            child: Image.asset("assets/ui.jpeg"),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
              "O Funny Memes é um aplicativo de edição de memes desenvolvido nas disciplinas de Programação Orientada a Objetos I e II, que tem o intuito de ser mobile e possibilitar a edição de diversos memes, com opções de edição normal e personalizada, além de ser possível visualizar o meme no histórico do aplicativo e realizar o download localmente no seu dispositivo."),
        ),
        const Spacer(),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Text.rich(TextSpan(children: [
              const TextSpan(text: 'Desenvolvido por: \n \t Flávio Glaydson -'),
              WidgetSpan(
                  child: GestureDetector(
                child: const Text("link do github"),
                onTap: () async => await launchUrl(urlFlavio),
              ))
            ]))),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Text.rich(TextSpan(children: [
              const TextSpan(text: 'Desenvolvido por: \n \t Isayan Deivid -'),
              WidgetSpan(
                  child: GestureDetector(
                child: const Text("link do github"),
                onTap: () => launchUrl(urlIsayan),
              ))
            ]))),
      ]),
    );
  }
}
