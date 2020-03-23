import 'package:flutter/material.dart';
import 'package:monitoring/screens/Monitoring/Monitoring.dart';
import './routes.dart';

void main() => runApp(MaterialApp(
  home: MyApp()
));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //TODO: move theme to another file to keep main clean?
      theme: ThemeData(
          // fontFamily: "Lato",
          primarySwatch: Colors.green,
          accentColor: Colors.greenAccent),
      //TODO: home should be placed in routes too?
      // home: null,
      routes: Routes.build(context: context),
    );
  }
}

