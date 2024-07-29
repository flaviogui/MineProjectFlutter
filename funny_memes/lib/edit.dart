import "package:flutter/material.dart";
import "package:image_downloader_web/image_downloader_web.dart";
import "package:image_downloader/image_downloader.dart";
import "components/bar.dart";
import "components/editetxt.dart";
import "components/controleredit.dart";
import "components/mytextfield.dart";
import "api.dart";
import "dart:io" show Platform;
import "package:flutter/foundation.dart" show kIsWeb;
import "package:permission_handler/permission_handler.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final controlerEdit = ControlerEdit();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controlerEdit.person,
        builder: (_, value, __) {
          return Scaffold(
              appBar: const MyBar(),
              body: ListView(children: [
                SizedBox(
                    height: 300,
                    width: 200,
                    child: Hero(
                      tag: api.choiceId,
                      child: ValueListenableBuilder(
                        valueListenable: api.urlEdit,
                        builder: (_, va, __) => Image.network(
                            controlerEdit.edit ? va : api.choiceUrl),
                      ),
                    )),
                value ? const EditPerson() : const EditNormal()
              ]));
        });
  }
}

class EditNormal extends StatefulWidget {
  const EditNormal({super.key});

  @override
  State<EditNormal> createState() => _EditNormalState();
}

class _EditNormalState extends State<EditNormal> {
  final controlerEdit = ControlerEdit();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 305,
        child: ListView.builder(
            itemCount: api.choiceBox,
            itemBuilder: (context, index) {
              return MyTextField(
                hint: "texto ${index + 1}",
                controler: addField(index),
              );
            }),
      ),
      const Buttons(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
            child: const Text("PERSONALIZAR"),
            onPressed: () {
              setState(() {
                controlerEdit.person.value = true;
              });
            }),
      )
    ]);
  }

  TextEditingController addField(index) {
    controlerEdit.addNormalText(TextEditingController());
    return controlerEdit.textsNormal[index];
  }
}

class EditPerson extends StatefulWidget {
  const EditPerson({super.key});

  @override
  State<EditPerson> createState() => _EditPersonState();
}

class _EditPersonState extends State<EditPerson> {
  final controlerEdit = ControlerEdit();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
            child: const Text("ADICIONAR TEXTO PERSONALIZADO"),
            onPressed: () {
              if (controlerEdit.textController.length < 20) {
                setState(() {
                  controlerEdit.textController.add(EditText());
                });
              }
            }),
      ),
      Column(
        children: controlerEdit.textController,
      ),
      const Buttons(),
    ]);
  }
}

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  final controlerEdit = ControlerEdit();
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Spacer(flex: 7),
      OutlinedButton(
          child: const Text("EDITAR"),
          onPressed: () {
            if (!controlerEdit.person.value &&
                controlerEdit.textsNormal.isNotEmpty) {
              controlerEdit.edit = true;
              api.getImage(controlerEdit.textsNormal
                  .map((value) => value.text)
                  .toList());
            } else if (controlerEdit.person.value &&
                controlerEdit.textController.isNotEmpty) {
              controlerEdit.edit = true;
              api.getPersonImage(controlerEdit.textController
                  .map((value) => value.control.toMap())
                  .toList());
            }
          }),
      const Spacer(),
      OutlinedButton(
          child: const Text("SALVA"),
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            var history = prefs.getStringList('history');
            prefs.setStringList('history', [api.jsonmeme, ...?history]);
            //
            history = prefs.getStringList('history');
            print(history);
            await WebImageDownloader.downloadImageFromWeb(api.urlEdit.value);
          }),
      const Spacer(flex: 7),
    ]);
  }
}
