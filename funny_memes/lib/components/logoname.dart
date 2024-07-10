import "package:flutter_animate/flutter_animate.dart";
import "package:flutter/material.dart";

class LogoName extends StatefulWidget {
  final double nameSize;
  final String name;
  final Duration time;
  const LogoName(
      {super.key,
      this.nameSize = 20,
      this.name = "FUNNY MEMES",
      this.time = const Duration(seconds: 3)});

  @override
  State<StatefulWidget> createState() => _LogoName();
}

class _LogoName extends State<LogoName> {
  @override
  Widget build(BuildContext context) {
    final name = widget.name;
    return Text("",
            style: TextStyle(fontSize: widget.nameSize, color: Colors.white))
        .animate()
        .custom(
            duration: widget.time,
            begin: 0,
            end: widget.nameSize,
            builder: (context, value, widget) {
              return Text(name,
                  style: TextStyle(fontSize: value, color: Colors.white));
            })
        .animate(onPlay: (controler) => controler.repeat())
        .custom(
            duration: 510.ms,
            begin: 0,
            end: 255,
            builder: (context, value, child) {
              return ShaderMask(
                  shaderCallback: (rect) {
                    return RadialGradient(
                      colors: <Color>[
                        Color.fromARGB(255, value.toInt(), 255, 0),
                        Color.fromARGB(
                            255, 255 - value.toInt(), 0, value.toInt())
                      ],
                      tileMode: TileMode.clamp,
                      radius: 3.0,
                      center: Alignment.center,
                    ).createShader(rect);
                  },
                  child: child);
            });
  }
}
