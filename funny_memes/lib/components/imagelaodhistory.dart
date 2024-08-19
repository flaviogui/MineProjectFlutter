import 'package:flutter/material.dart';
import 'package:funny_memes/api.dart';
import 'package:funny_memes/func/loadhistory.dart';
import 'package:funny_memes/selection.dart';

class ImageHistory extends StatefulWidget {
  final int index;
  const ImageHistory({super.key,required  this.index,});

  @override
  State<ImageHistory> createState() => _ImageHistoryState();
}

class _ImageHistoryState extends State<ImageHistory> {
  @override
  Widget build(BuildContext context) {
    print("id:${widget.index}");
    print("url:${api.memeshistory[widget.index]}");
    return ValueListenableBuilder(
      valueListenable: api.memeshistory[widget.index] ?? ValueNotifier(""),
      builder:(_,value,__) => GestureDetector(
        onTap: (() {
          loadHistory(widget.index).then((value) => Navigator.pushNamed(context,"/edit"));
        }),
        child: value != "" ? Image.network(value) : const Loading()
        ),
    );

  }
}