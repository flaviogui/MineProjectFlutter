import "package:flutter/material.dart";
import "logoname.dart";

class MyBar extends StatelessWidget implements PreferredSizeWidget {
  final bool home;
  const MyBar({super.key, this.home = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Row(
          children: [
            const Spacer(),
            LogoName(),
            const Spacer(),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) Navigator.pop(context);
                  if (value == 2) Navigator.popAndPushNamed(context, "/");
                },
                itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                          value: 1,
                          child: Icon(Icons.arrow_back, color: Colors.black)),
                      if (home)
                        const PopupMenuItem(
                            value: 2,
                            child: Icon(Icons.home, color: Colors.black)),
                    ]),
          ],
        ));
  }
}
