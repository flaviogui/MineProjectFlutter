import "package:flutter/material.dart";
import "components/logoname.dart";
import "components/globe.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Spacer(),
          const Center(child: LogoName(nameSize: 30)),
          const Spacer(),
          const Center(
              child: Text("NAVEGUE PELO MUNDO DOS MEMES",
                  style: TextStyle(fontSize: 15))),
          const Spacer(flex: 7),
          const Globe(),
          const Spacer(flex: 7),
          SizedBox(
            height: 200,
            width: 200,
            child: GestureDetector(
              child: Hero(
                child: Image.asset("assets/ui.jpeg"),
                tag: "assd",
              ),
              onTap: () => Navigator.pushNamed(context, "/sobre"),
            ),
          )
        ]),
        backgroundColor: const Color(0xffffffff));
  }
}
