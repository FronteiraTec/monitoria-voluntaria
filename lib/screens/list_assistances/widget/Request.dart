import 'Assistances.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Request{

   Future<List<Assistances>> data(String search, int offset) async {
    
    var queryParameters = {
      'limit': '10',
      'offset': offset.toString(),
      "avaliabel": "true"
    };
    var uri;
    if(search == ""){
      uri = Uri.http('131.108.55.50:3000', '/assistance', queryParameters);
    }else{
      uri = Uri.http('131.108.55.50:3000', '/assistance/name/$search', queryParameters);
    }
    
    http.Response response = await http.get(uri);

    var dados = json.decode(response.body);

    List<Assistances> assistances = List();
    

  for(var dado in dados){ 
    assistances.add(Assistances.fromJson(dado));
  }
    return assistances;
  }

}