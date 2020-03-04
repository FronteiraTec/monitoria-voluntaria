import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final focus = FocusNode();

  TextEditingController _controllerId = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monitoring",
          style: TextStyle(
            color: Color.fromRGBO(1, 13, 34, .4),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            letterSpacing: 10.0 
          ),
        ), centerTitle: true,

        backgroundColor: Color.fromRGBO(1, 29, 74, .5),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage("images/old-books.jpg"),
                fit: BoxFit.fill
              )
            ),
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
                        color: focus.hasFocus ? Colors.red : Colors.blue
                      )
                      ),
                      style: TextStyle(color: Colors.blueGrey),
                      onSubmitted: (event)=>FocusScope.of(context).requestFocus(focus),
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
                        color: focus.hasFocus ? Colors.blue : Colors.red
                                              )
                      ),
                      style: TextStyle(color: Colors.blueGrey),
                      controller: _controllerPassword,  

                  ),
                )
                
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
        
    );
  }
}


