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
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
              height: 80.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: new List.generate(10, (int index) {
                  return new Card(
                    color: Colors.blue[index * 100],
                    child: new Container(
                      width: 50.0,
                      height: 50.0,
                      child: new Text("$index"),
                    ),
                  );
                }),
              ),
            ),       
      Expanded(
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
                    return Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    );
                  } else{
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
            ])
      )
    );
  }
}
