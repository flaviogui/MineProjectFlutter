import"package:flutter_animate/flutter_animate.dart";
import "package:flutter/material.dart";
import "package:funny_memes/api.dart";
import "package:shared_preferences/shared_preferences.dart";

class Globe extends StatefulWidget {
  const Globe({super.key});
  @override
  State<StatefulWidget> createState() => _Globe();
}

class _Globe extends State<Globe> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Image.asset(
          scale:1,
          "assets/globe.png"
                )            .animate(
              onPlay: (controler) => controler.repeat(),
            )
            .rotate(duration: const Duration(seconds: 3), curve: Curves.linear),
        onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    var success =  prefs.getStringList('user');
                    if(success != null){
                      api.apiUser = success[0];
                      api.apiPassword = success[1];
                      Navigator.pushNamed(context, "/selection");
                    }else{
                      Navigator.pushNamed(context, '/login');
                    }
                });
  }
}
