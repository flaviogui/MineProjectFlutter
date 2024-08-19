import 'package:flutter/material.dart';
import 'package:funny_memes/api.dart';
import 'package:funny_memes/components/bar.dart';
import 'package:funny_memes/components/imagelaodhistory.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const MyBar(),
      body: ValueListenableBuilder(
        valueListenable: api.lenghthistory,
        builder:(_,value,__) {
          return ListView.builder(
          itemCount: value,
          itemBuilder:(context, index) => ImageHistory(index: index)
        );}
      ),
    );
  }
}