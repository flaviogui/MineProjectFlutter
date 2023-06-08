import "package:flutter/material.dart";
import "components/bar.dart";
import "components/editetxt.dart";
import "components/controleredit.dart";
import "components/mytextfield.dart";
import "api.dart";

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
              appBar: MyBar(),
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
                value ? EditPerson() : EditNormal()
              ]));
        });
  }
}

class EditNormal extends StatefulWidget {
  @override
  State<EditNormal> createState() => _EditNormalState();
}

class _EditNormalState extends State<EditNormal> {
  final controlerEdit = ControlerEdit();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MyTextField(
          controler: controlerEdit.topControlerEdit, hint: "texto superior"),
      MyTextField(
          controler: controlerEdit.bottomControlerEdit, hint: "texto inferior"),
      Buttons(),
      OutlinedButton(
          child: const Text("PERSONALIZAR"),
          onPressed: () {
            setState(() {
              controlerEdit.person.value = true;
            });
          })
    ]);
  }
}

class EditPerson extends StatefulWidget {
  @override
  State<EditPerson> createState() => _EditPersonState();
}

class _EditPersonState extends State<EditPerson> {
  final controlerEdit = ControlerEdit();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OutlinedButton(
          child: const Text("ADICIONAR TEXTO PERSONALIZADO"),
          onPressed: () {
            setState(() {
              controlerEdit.textController.add(EditText());
            });
          }),
      Column(
        children: controlerEdit.textController,
      ),
      Buttons(),
    ]);
  }
}

class Buttons extends StatefulWidget {
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  final controlerEdit = ControlerEdit();
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      OutlinedButton(
          child: const Text("EDITAR"),
          onPressed: () {
            if (!controlerEdit.person.value &&
                controlerEdit.topControlerEdit.text != "" &&
                controlerEdit.topControlerEdit.text != "") {
              controlerEdit.edit = true;
              api.getImage(controlerEdit.topControlerEdit.text,
                  controlerEdit.bottomControlerEdit.text);
            } else if (controlerEdit.person.value &&
                controlerEdit.textController.length > 0) {
              controlerEdit.edit = true;
              api.getPersonImage(controlerEdit.textController
                  .map((value) => value.control.toMap())
                  .toList());
            }
          }),
      OutlinedButton(child: const Text("SALVA"), onPressed: () {}),
    ]);
  }
}
