import "dart:convert";
import "package:flutter/material.dart";
import "package:funny_memes/api.dart";
import "package:funny_memes/components/controleredit.dart";
import "package:shared_preferences/shared_preferences.dart";
import "components/logoname.dart";
import "components/globe.dart";
import "components/editetxt.dart";

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
                tag: "assd",
                child: Image.asset("assets/ui.jpeg"),
              ),
              onTap: () => Navigator.pushNamed(context, "/sobre"),
            ),
          ),
          TextButton(
              onPressed: () {
                SharedPreferences.getInstance().then((value) {
                  var history = value.getStringList('history')?[0];
                  var sol = jsonDecode(history ?? "");
                  print(sol);
                  List<Map<String, dynamic>> fields = [{}];
                  int boxes = 0;
                  bool person = false;
                  for (String c in sol.keys) {
                    if (c.contains("template_id")) {
                      api.choiceId = sol[c];
                    }
                    if (c.contains("altura")) {
                      api.choiceY = int.parse(sol[c]);
                    }
                    if (c.contains("largura")) {
                      api.choiceX = int.parse(sol[c]);
                    }
                    if (c.contains('url')) {
                      api.choiceUrl = sol[c];
                    }
                    if (c.contains("boxes[${(boxes + 1).toString()}]")) {
                      boxes++;
                      fields.add({});
                    }
                    if (c.contains(boxes.toString()) && c.contains("boxes")) {
                      try {
                        //if(fields.length != boxes+1 || c.contains("boxes[${(boxes+1).toString()}]")){
                        //  boxes++;
                        // fields.add({});
                        //}
                        if (c.contains("text"))
                          fields[boxes]['text'] = sol[c];
                        else if (c.contains("x")) fields[boxes]['x'] = sol[c];
                        if (c.contains("y")) fields[boxes]['y'] = sol[c];
                        if (c.contains("width"))
                          fields[boxes]['width'] = sol[c];
                        if (c.contains("height"))
                          fields[boxes]['height'] = sol[c];
                        if (c.contains("outline"))
                          fields[boxes]['outline_color'] = sol[c];
                        else if (c.contains("color"))
                          fields[boxes]['color'] = sol[c];
                        //if(fields[boxes].keys.length >= 7) boxes++;
                      } catch (e) {
                        print(e);
                        print(boxes);
                      }
                    }
                  }
                  if (fields[0].keys.length > 1) person = true;
                  print(boxes);
                  print(api.choiceUrl);
                  print(api.choiceId);
                  print(person);
                  print(fields);
                  var controler = ControlerEdit();
                  controler.reset();
                  for (var c in fields) {
                    print("error 1");
                    if (person) {
                      print("error 2");
                      controler.person.value = true;
                      controler.textController.add(EditText());
                      print("error 3");
                      c["color"] = "0x${c["color"].substring(1)}";
                      c["outline_color"] =
                          "0x${c["outline_color"].substring(1)}";
                      print(c["color"]);
                      controler.textController[0].alter(EditTextControler(
                          c["text"],
                          int.tryParse(c["x"]) ?? 1,
                          int.tryParse(c["y"]) ?? 1,
                          int.tryParse(c["outline_color"]) ?? 1,
                          int.tryParse(c["color"]) ?? 1,
                          int.tryParse(c["height"]) ?? 1,
                          int.tryParse(c["width"]) ?? 1));
                      print("error 4");
                    }
                  }
                  Navigator.pushNamed(context, "/edit");
                });
              },
              child: Text("dev"))
        ]),
        backgroundColor: const Color(0xffffffff));
  }
}
