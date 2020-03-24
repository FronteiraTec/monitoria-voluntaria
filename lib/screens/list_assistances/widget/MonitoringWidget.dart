import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../general_widgets/drawer/drawer.dart';
import '../../../screens/assistance_detail/assistance_detail_screen.dart';

import './Assistances.dart';

class MonitoringWidget extends StatefulWidget {
  @override
  _MonitoringWidgetState createState() => _MonitoringWidgetState();
}

//TODO: adicionar paginação https://pub.dev/packages/loadmore ou implementar você mesmo! https://medium.com/@KarthikPonnam/flutter-loadmore-in-listview-23820612907d

class _MonitoringWidgetState extends State<MonitoringWidget> {
  Future<List<Assistances>> _data() async {
    
    var queryParameters = {
      'limit': '10',
      'offset': '0',
      "avaliabel": "true"
    };

    var uri = Uri.http('131.108.55.50:3000', '/assistance', queryParameters);

    
    http.Response response = await http.get(uri);

    var dados = json.decode(response.body);


    List<Assistances> assistances = List();

    print(DateTime.parse(dados[0]["date"]));

    for (var dado in dados) {      
      assistances.add(
        Assistances(
          title: dado["title"],
          course: dado["course"],
          description: dado["description"],
          idAssistance: dado["assistance_id"],
          idAssistant: dado["owner_id"],
          location: dado["location"],
          numberParticipants: dado["number_participants"],
          date: DateTime.parse(dado["date"]),
        ),
      );
    }

    print("OI");

    return assistances;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Monitoring"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
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
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Assistances>>(
                future: _data(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return CircularProgressIndicator();
                      break;
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                      break;
                    case ConnectionState.active:
                      return CircularProgressIndicator();
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
                            return ListTile(
                              title: Text(assis.title),
                              subtitle: Text(assis.location),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AssitanceDetailScreen.routeName,
                                    arguments: assis);
                              },
                            );
                          },
                        );
                      }
                  }
                      return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
