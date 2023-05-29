import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "routes.dart";


void main(){
  Animate.restartOnHotReload = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes:routes,
      initialRoute:"/"
    );
  }
}
