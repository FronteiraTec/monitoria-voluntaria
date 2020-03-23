import 'package:flutter/material.dart';
import 'package:monitoring/general_widgets/drawer/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:monitoring/screens/assistance_detail/assistance_detail_screen.dart';
import 'dart:async';
import 'dart:convert';

import 'Assistances.dart';

class MonitoringWidget extends StatefulWidget {
  @override
  _MonitoringWidgetState createState() => _MonitoringWidgetState();
}

class _MonitoringWidgetState extends State<MonitoringWidget> {
  Future<List<Assistances>> _data() async {
    http.Response response =
        await http.get("http://192.168.0.107:3001/assistance");
    var dados = json.decode(response.body);
    // print("ali");
    // print(dados[0]["data"]);
    var teste = dados["data"];
    List<Assistances> assistances = List();
    for (var dado in teste) {     
      var assistance = Assistances(
          active: dado["active"],
          assistanceName: dado["assistanceName"],
          course: dado["course"],
          description: dado["description"],
          idAssistance: dado["idAssistance"],
          idAssistant: dado["idAssistant"],
          location: dado["location"],
          numberParticipants: dado["numberParticipants"],
          schedule: dado["schedule"],);
      assistances.add(assistance);
    }
    return assistances;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Monitoring"),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Container(
                height: 80.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      10,
                      (int index) => Card(
                            color: Colors.blue[index * 100],
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              child: Text("$index"),
                            ),
                          )),
                ),
              ),
              Expanded(
                  child: FutureBuilder<List<Assistances>>(
                      future: _data(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            break;
                          case ConnectionState.waiting:
                            return CircularProgressIndicator();
                            break;
                          case ConnectionState.active:
                            break;
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 60,
                              );
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  List<Assistances> assitance = snapshot.data;
                                  Assistances assis = assitance[index];
                                  // print(assis);
                                  return ListTile(
                                    title: Text(assis.assistanceName),
                                    subtitle: Text(assis.location),
                                    onTap: () {
                                      print(AssitanceDetailScreen.routeName);
                                      Navigator.of(context).pushNamed(AssitanceDetailScreen.routeName, arguments: assis);
                                    },
                                  );
                                },
                              );
                            }
                            break;
                        }
                      })),
            ])));
  }
}
