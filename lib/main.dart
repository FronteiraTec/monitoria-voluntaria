import 'package:flutter/material.dart';
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
          primarySwatch: Colors.green,
          accentColor: Colors.greenAccent),
      routes: Routes.build(context: context),
    );
  }
}

