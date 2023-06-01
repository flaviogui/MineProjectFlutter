import "package:flutter_animate/flutter_animate.dart";
import "package:flutter/material.dart";

class LogoName extends StatefulWidget{
  final nameSize;
  LogoName({super.key,this.nameSize = 20});

  @override
  State<StatefulWidget> createState() => _LogoName();

}

class _LogoName extends State<LogoName>{

  @override
  Widget build(BuildContext context){
    return Text(
      "",
      style:TextStyle(fontSize:widget.nameSize,color:Colors.white)
      ).animate()
      .custom(
        duration:3.seconds,
        begin:0,
        end:widget.nameSize,
        builder:(context,value,widget){
          return Text(
            "FUNNY MEMES",
            style:TextStyle(fontSize:value,color:Colors.white)
            );
        }
      ).animate(
        onPlay:(Controler) => Controler.repeat()
      )
        .custom(
        duration: 510.ms,
        begin:0,
        end:255,
        builder:(context,value,child){
          return ShaderMask(
            shaderCallback: (rect){
                return RadialGradient(
                  colors:<Color>[
                    Color.fromARGB(255,value.toInt(),255,0),
                    Color.fromARGB(255,255-value.toInt(),0,value.toInt())],
                  tileMode: TileMode.clamp,
                  radius: 3.0,
                  center: Alignment.center,
                ).createShader(rect);
            },
            child:child
          );
        }
        );
  }
}
