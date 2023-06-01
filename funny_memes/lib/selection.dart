import "package:flutter/material.dart";
import "components/bar.dart";
import "api.dart";



class Selection extends StatefulWidget{
  const Selection({super.key});
  @override 
  State<StatefulWidget> createState() => _Selection();
}

class _Selection extends State<Selection>{
  
  @override 
  void initState() {
      api.value.getMemes();
      super.initState();
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:MyBar(),
      body:ListView.builder(
        itemCount:100,
        itemBuilder:(context,index){
          var url = "";
          var id = "";
          if(api.value.memes.length > 1){
            url = api.value.memes[index]["url"];
            id = api.value.memes[index]["id"];
          }
          return ValueListenableBuilder(
            valueListenable:api,
            builder:(_, value, __){
              return IconMeme(
                url:url,
                id:id
                );
              }
            );
        }
      )
    );
  }
}

class IconMeme extends StatelessWidget{
  final id;
  final url;
  const IconMeme({super.key,this.id,this.url});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Container(
        child:Hero(
          child: Image.network(url != "" ? url :"https:\/\/i.imgflip.com\/3umnr3.jpg"),
          tag:id
          )
      ),
      onTap:() {
         api.value.choiceUrl = url;
         api.value.choiceId = id;
         Navigator.pushNamed(context,"/edit");
         }
    );
  }
}
