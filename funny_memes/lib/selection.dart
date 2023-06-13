import "package:flutter/material.dart";
import "components/bar.dart";
import "api.dart";
import "components/controleredit.dart";



class Selection extends StatefulWidget{
  const Selection({super.key});
  @override 
  State<StatefulWidget> createState() => _Selection();

}

class _Selection extends State<Selection>{
  
  @override 
  void initState() {
      api.getMemes();
      super.initState();
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:MyBar(),
      body:ListView.builder(
        itemCount:50,
        itemBuilder:(context,index){
          var url = "";
          var id = "";
          return Row(
            children: [
              Spacer(),
              IconMeme(
                url:url,
                id:id,
                index:index
                ),
              Spacer(),
              IconMeme(
                url:url,
                id:id,
                index:index+50
                ),
              Spacer(),
            ],
          );
          }
      )
    );
  }
}

class IconMeme extends StatelessWidget{
  final id;
  final url;
  final index;
  final controler =  ControlerEdit();
  IconMeme({super.key,this.id,this.url,this.index});
  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder(
        valueListenable:api.memes,
        builder: (_,value,__) { 
          String id = this.id;
          String url = this.url;
          var x = 100;
          var y = 100;
          var box = 2;
          if(api.memes.value.length > 4){
            url = api.memes.value[index]["url"];
            id = api.memes.value[index]["id"];
            x = api.memes.value[index]["width"];
            y = api.memes.value[index]["height"];
            box = api.memes.value[index]["box_count"];
          }
          return GestureDetector(
          child: Container(
            child: url != "" ? Hero(child: Container(margin:EdgeInsets.symmetric(vertical:10),height:300,width:MediaQuery.of(context).size.width/2-20, child: Image.network(value[index]["url"],fit:BoxFit.fill)),tag:id) : Loading()),
            onTap:() {
            api.choiceX = x;
            api.choiceY = y;
            api.choiceBox = box;
            api.choiceUrl = url;
            api.choiceId =  id;
            controler.reset();
            Navigator.pushNamed(context,"/edit");
            }
        );}
      );
  }
}


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.forward(); // Inicia a animação do ícone de carregamento
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: CircularProgressIndicator(
          value: controller.value,
          semanticsLabel: 'loading',
        ),
      ),
    );
  }
}
