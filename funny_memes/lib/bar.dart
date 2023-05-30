import "package:flutter/material.dart";

class MyBar extends StatefulWidget implements PreferredSizeWidget{

  final bool home;
  const MyBar({super.key,this.home = false});

  @override
  State<MyBar> createState() => _MyBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyBarState extends State<MyBar> {
  late final cont;
  @override 
  Widget build(BuildContext context){
    cont = context;
    return AppBar(
      title:Text("FUNNY MEMES"),
      actions: [
        PopupMenuButton(
          onSelected:(value){
            if(value == 1) Navigator.pop(context);
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              child:Icon(Icons.arrow_back,color:Colors.black),
              value:1
            ) ,
            if (widget.home) const PopupMenuItem(
              child:Icon(Icons.home,color:Colors.black)
            ),
          ]
        )
      ]
    );
  }
}
