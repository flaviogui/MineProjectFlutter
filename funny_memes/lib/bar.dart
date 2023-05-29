import "package:flutter/material.dart";

class MyBar extends StatelessWidget implements PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final bool home;
  const MyBar({super.key,this.home = false});
  @override 
  Widget build(BuildContext context){
    return AppBar(
      title:Text("FUNNY MEMES"),
      actions: [
      ]
    );
  }
}

class DropMenu extends StatefulWidget {
  final List<String> list;
  const DropMenu({super.key,required this.list});

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: ":",
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged:(value) {

      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

