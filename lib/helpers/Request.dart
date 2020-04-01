import '../screens/list_assistances/widget/Assistances.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Request{

   Future<List<Assistances>> data(String search, int offset) async {
    
    var queryParameters = {
      'limit': '25',
      'offset': offset.toString(),
      "avaliabel": "true"
    };

    var uri;
    if(search == ""){
      uri = Uri.http('131.108.55.50:3000', '/assistance', queryParameters);
    } else{
      uri = Uri.http('131.108.55.50:3000', '/assistance/name/$search', queryParameters);
    }
    
    http.Response response = await http.get(uri);

    var dados = json.decode(response.body);


    List<Assistances> assistances = List();

    // print(DateTime.parse(dados[0]["date"]));

    for (var dado in dados) {      
      assistances.add(
        Assistances(
          title: dado["assistance_title"],
          description: dado["assistance_description"],
          idAssistance: dado["assistance_id"],
          idAssistant: dado["assistance_owner_id"],
          location: dado["assistance_local_id"],
          numberParticipants: dado["assistance_num_participants"],
          date: DateTime.parse(dado["assistance_date"]),
        ),
      );
    }

    print("OI");

    return assistances;
  }

}