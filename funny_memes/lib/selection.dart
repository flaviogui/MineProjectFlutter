import "package:flutter/material.dart";
import "bar.dart";

class Selection extends StatefulWidget{
  const Selection({super.key});
  @override 
  State<StatefulWidget> createState() => _Selection();
}

class _Selection extends State<Selection>{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar:MyBar()
    );
  }
}
