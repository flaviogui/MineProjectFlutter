import 'package:http/http.dart' as http;
import 'dart:convert';

class Api{
  
  
  Future<List<dynamic>> getMemes() async{
    Uri uriGet = Uri(
      scheme:"https",
      host:"api.imgflip.com",
      path:"get_memes"
    );
    String jsonString = await http.read(uriGet);
    print(jsonString); 
    var retorno = jsonDecode(jsonString);
    return retorno["data"]["memes"];
  }

}
