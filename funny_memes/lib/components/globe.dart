import"package:flutter_animate/flutter_animate.dart";
import "package:flutter/material.dart";

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
        onTap: () => Navigator.pushNamed(context, "/selection"));
  }
}
