import "package:flutter/material.dart";
import "package:funny_memes/func/loadhistory.dart";
import "logoname.dart";

class MyBar extends StatelessWidget implements PreferredSizeWidget {
  final bool home;
  final bool history;
  const MyBar({super.key, this.home = true,this.history = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Row(
          children: [
            const Spacer(),
            const LogoName(),
            const Spacer(),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) Navigator.pop(context);
                  if (value == 2) Navigator.popAndPushNamed(context, "/");
                  if (value == 3) {
                    loadALL();
                    Navigator.pushNamed(context, "/history");
                    }
                },
                itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                          value: 1,
                          child: Icon(Icons.arrow_back, color: Colors.black)),
                      if (home)
                        const PopupMenuItem(
                            value: 2,
                            child: Icon(Icons.home, color: Colors.black)),
                      if (history)
                        const PopupMenuItem(
                            value: 3,
                            child: Icon(Icons.history , color: Colors.black)),
                    ]),
          ],
        ));
  }
}
