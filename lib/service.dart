import 'dart:convert';

import 'package:apipactis/model.dart';
import 'package:http/http.dart';

class apiservice {
  final allnews =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5cd8ce8bd4540d697107c5087d79c85";

  Future<List<newsmodel>> getallnews() async {
    try {
      Response response = await get(Uri.parse(allnews));

      if(response.statusCode==200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];

        List<newsmodel> artical = body.map((item)=> newsmodel.fromJson(item)).toList();

        return artical;
        print(artical);
      }else{
        throw("eror");
      }
    } catch (e) {
      throw(e);
    }
  }
}
