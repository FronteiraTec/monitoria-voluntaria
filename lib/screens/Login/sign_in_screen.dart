import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monitoring/general_widgets/drawer/drawer.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final focus = FocusNode();

  TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
        // appBar: AppBar(
        //   // title: Text(
        //   //   "Entrar",
        //   //   style: TextStyle(
        //   //     //Exemplo de como usar o tema
        //   //     // color: Theme.of(context).primaryColorLight,
        //   //     fontSize: 20,
        //   //   ),
        //   ),
          // backgroundColor: Theme.of(context).primaryColor,
        // ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: new AssetImage("assets/images/old-books.jpg"),
          //         fit: BoxFit.fill), ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "ID UFFS",
                      labelStyle: TextStyle(
                          color: focus.hasFocus ? Colors.red : Colors.blue)),
                  style: TextStyle(color: Colors.blueGrey),
                  onSubmitted: (event) =>
                      FocusScope.of(context).requestFocus(focus),
                  controller: _controllerId,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  autocorrect: false,
                  focusNode: focus,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "PASSWORD",
                      labelStyle: TextStyle(
                          color: focus.hasFocus ? Colors.blue : Colors.red)),
                  style: TextStyle(color: Colors.blueGrey),
                  controller: _controllerPassword,
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ));
  }
}
