import "package:flutter/material.dart";
import "logoname.dart";

class MyBar extends StatelessWidget implements PreferredSizeWidget {
  final bool home;
  const MyBar({super.key, this.home = true});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Row(
          children: [
            Spacer(),
            LogoName(),
            Spacer(),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) Navigator.pop(context);
                  if (value == 2) Navigator.popAndPushNamed(context, "/");
                },
                itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                          child: Icon(Icons.arrow_back, color: Colors.black),
                          value: 1),
                      if (home)
                        const PopupMenuItem(
                            child: Icon(Icons.home, color: Colors.black),
                            value: 2),
                    ]),
          ],
        ));
  }
}
