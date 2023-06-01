import "package:flutter/material.dart";
import "components/bar.dart";
import "api.dart";

class Edit extends StatelessWidget{
  const Edit({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyBar(),
      body:ListView(
        children:[
          SizedBox(
            height:300,
            width:200,
            child: Hero(
              tag:api.value.choiceId,
              child: Image.network(api.value.choiceUrl
              ),
            ))
        ]
      )
      );
  }
}
