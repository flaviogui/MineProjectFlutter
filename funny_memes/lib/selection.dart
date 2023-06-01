import "package:flutter/material.dart";
import "components/bar.dart";
import "api.dart";

var api = Api();

class Selection extends StatefulWidget {
  const Selection({super.key});
  @override
  State<StatefulWidget> createState() => _Selection();
}

class _Selection extends State<Selection> {
  List<Widget> items = [];
  @override
  Widget build(BuildContext) {
    createItems();
    /*   items.add(TextButton(
        child: Text("apertar aqui"),
        onPressed: () => setState(() {
              createItems();
            })));
      */
    return Scaffold(
        appBar: const MyBar(),
        body: SingleChildScrollView(child: Column(children: items)));
  }

  Future<void> createItems() async {
    var list = await api.getMemes();
    List<Widget> rows = [];
    for (int x = 0; x <= 22; x++) {
      List<Widget> row = [];
      for (int y = 0; y <= 1; y++) {
        row.add(IconMeme(url: list[x * 23 + y]["url"]));
      }
      rows.add(Row(children: row));
    }
    this.items.addAll(rows);
  }
}

class IconMeme extends StatelessWidget {
  final id;
  final url;
  const IconMeme({super.key, this.id, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(height: 50, width: 50, child: Image.network(url)),
    );
  }
}
