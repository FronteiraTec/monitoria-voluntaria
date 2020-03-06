import 'package:flutter/material.dart';
import 'package:monitoring/general_widgets/drawer/drawer.dart';

class AllTeachingAssitanceScreen extends StatelessWidget {
  static const routeName = "/all-assitances";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monitorias"),
      ),
      drawer: MyDrawer(),
    );
  }
}