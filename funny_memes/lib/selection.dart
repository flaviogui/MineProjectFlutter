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
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([<Widget>[]]);
  @override
  Widget build(BuildContext context) {
    createItems();
    return Scaffold(
        appBar: const MyBar(),
        body: SingleChildScrollView(
          child: ValueListenableBuilder(
              valueListenable: tableStateNotifier,
              builder: (_, value, __) {
                return Column(children: value[0]);
              }),
        ));
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
    tableStateNotifier.value[0] = rows;
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
