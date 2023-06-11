import "package:flutter/material.dart";
import "components/bar.dart";
import "api.dart";
import "components/controleredit.dart";

class Selection extends StatefulWidget {
  const Selection({super.key});
  @override
  State<StatefulWidget> createState() => _Selection();
}

class _Selection extends State<Selection> {
  @override
  void initState() {
    api.getMemes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyBar(),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              var url = "";
              var id = "";
              return IconMeme(url: url, id: id, index: index);
            }));
  }
}

class IconMeme extends StatelessWidget {
  final id;
  final url;
  final index;
  final controler = ControlerEdit();
  IconMeme({super.key, this.id, this.url, this.index});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: api.memes,
        builder: (_, value, __) {
          String id = this.id;
          String url = this.url;
          if (api.memes.value.length > 4) {
            url = api.memes.value[index]["url"];
            id = api.memes.value[index]["id"];
          }
          return GestureDetector(
              child: Container(
                  child: url != ""
                      ? Hero(child: Image.network(value[index]["url"]), tag: id)
                      : Loading()),
              onTap: () {
                api.choiceUrl = url;
                api.choiceId = id;
                controler.reset();
                Navigator.pushNamed(context, "/edit");
              });
        });
  }
}

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.forward(); // Inicia a animação do ícone de carregamento
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: CircularProgressIndicator(
          value: controller.value,
          semanticsLabel: 'loading',
        ),
      ),
    );
  }
}
