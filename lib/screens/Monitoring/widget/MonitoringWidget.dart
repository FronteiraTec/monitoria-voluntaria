import 'package:flutter/material.dart';
import 'package:monitoring/general_widgets/drawer/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Assistances.dart';

class MonitoringWidget extends StatefulWidget {
  static const String routeName = "/AssistanceWidget";
  @override
  _MonitoringWidgetState createState() => _MonitoringWidgetState();
}

class _MonitoringWidgetState extends State<MonitoringWidget> {

    Future<List<Assistances>> _data() async{
      http.Response response = await http.get("https://jsonplaceholder.typicode.com/posts");
      var dados = json.decode(response.body);
      List<Assistances> assistances = List();
      for(var dado in dados){
        Assistances assistance = Assistances(dado["Userid"], dado["id"], dado["title"], dado["body"]);
        assistances.add(assistance);
        print(assistance.toString());
      }
      return assistances;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Monitoring"), centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List<Assistances>>(
            future: _data(),
            builder: (context, snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if(snapshot.hasError){
                    print("Erro na conexão");
                  } else{
                    print("Entrou");
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index){
                        List<Assistances> assitance = snapshot.data;
                        Assistances assis = assitance[index];
                        return ListTile(
                          title: Text(assis.locale),
                          subtitle: Text(assis.dateTime),
                        );
                      },
                    );
                  }
                  break;
              }
            } 
          ) 
          ),
    );
  }
}
