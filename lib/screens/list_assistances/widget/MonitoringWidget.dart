import 'package:flutter/material.dart';

import '../../../general_widgets/drawer/drawer.dart';
import '../../../screens/assistance_detail/assistance_detail_screen.dart';

import './Assistances.dart';
import './CustomSearch.dart';
import './Request.dart';

class MonitoringWidget extends StatefulWidget {
  @override
  _MonitoringWidgetState createState() => _MonitoringWidgetState();
}

//TODO: adicionar paginação https://pub.dev/packages/loadmore ou implementar você mesmo! https://medium.com/@KarthikPonnam/flutter-loadmore-in-listview-23820612907d

class _MonitoringWidgetState extends State<MonitoringWidget> {
 
   var _search = "";
   var _offset = 0;
  _data(String search, int offset){
    Request request = Request();
    return request.data(search, offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Monitoring"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              _search = await showSearch(context: context, delegate: CustomSearch());
              _data(_search, _offset);
              _offset = 0;
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (int index) => Card(
                    color: Colors.lightGreen[index * 100],
                    child: Container(
                      width: 80.0,
                      child: Text("$index"),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Assistances>>(
                future: _data(_search, _offset),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                       return Center(
                        child: CircularProgressIndicator()
                      );
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
                            return GestureDetector(
                              child: ListTile(
                              title: Text(assis.title),
                              subtitle: Text("Data: ${assis.date.day.toString()}/${assis.date.month.toString()}/${assis.date.year.toString()}\nHora: ${assis.date.hour.toString()}:${assis.date.minute.toString()}"),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AssitanceDetailScreen.routeName,
                                    arguments: assis);
                              },
                            ),
                            onHorizontalDragEnd: (event){
                              if(event.primaryVelocity > 0){
                                if(_offset > 0){
                                  setState(() {
                                  _offset -= 10;
                                });
                                }
                              } else{
                                setState(() {
                                  _offset += 10;
                                });
                              }
                              
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
