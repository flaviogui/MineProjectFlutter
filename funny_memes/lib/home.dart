import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Spacer(),
          Center(
              child: Text(
            "",
          ).animate().custom(
                  duration: 3.seconds,
                  begin: 0,
                  end: 30,
                  builder: (context, value, widget) {
                    return Text(
                      "FUNNY MEMES",
                      style: TextStyle(
                          fontSize: value,
                          color: Color.fromARGB(255, 3, 18, 91)),
                    );
                  })),
          Spacer(),
          Center(
              child: Text("NAVEGUE PELO MUNDO DOS MEMES",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 3, 18, 91)))),
          Spacer(flex: 7),
          Globe(),
          Spacer(flex: 7),
          Image.network(
              "data:image/jpeg;base64,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")
        ]),
        backgroundColor: Color(0xcccfd4));
  }
}

class Globe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Globe();
}

class _Globe extends State<Globe> {
  @override
  Widget build(BuildContext) {
    return GestureDetector(
        child: Image.network(
                scale: 1,
                'data:image/jpeg;base64,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')
            .animate(
              onPlay: (Controler) => Controler.repeat(),
            )
            .rotate(duration: Duration(seconds: 3), curve: Curves.linear),
        onTap: () => Navigator.pushNamed(context, "/selection"));
  }
}
