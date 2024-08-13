import "dart:convert";

import "package:flutter/material.dart";
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
                    var history =  value.getStringList('history')?[0];
                    var sol = jsonDecode(history?? "");
                    print(sol);
                    List<Map<String,dynamic>> fields = [{}];
                    int boxes = 0;
                    bool person = false;
                    for(String c in sol.keys){
                      if(c.contains("boxes[${(boxes+1).toString()}]")){
                        boxes++;
                        fields.add({});
                      }
                      if(c.contains(boxes.toString()) && c.contains("boxes")){
                        try{
                          //if(fields.length != boxes+1 || c.contains("boxes[${(boxes+1).toString()}]")){
                          //  boxes++;
                          // fields.add({});
                          //}
                          if(c.contains("text")) fields[boxes]['text'] = sol[c];
                          else if (c.contains("x")) fields[boxes]['x'] = sol[c];
                          if (c.contains("y")) fields[boxes]['y'] = sol[c];
                          if (c.contains("width")) fields[boxes]['width'] = sol[c];
                          if (c.contains("height")) fields[boxes]['height'] = sol[c];
                          if (c.contains("outline")) fields[boxes]['outline_color'] = sol[c];
                          else if (c.contains("color")) fields[boxes]['color'] = sol[c];  
                          //if(fields[boxes].keys.length >= 7) boxes++;
                        }catch(e){
                          print(e);
                          print(boxes);
                        }
                      
                      }
                    }
                    if(fields[0].keys.length > 1) person = true;
                    print(boxes);
                    print(person);
                    print(fields);
                  });
  
              }, 
              child: Text("dev"))
        ]),
        backgroundColor: const Color(0xffffffff));
  }
}



