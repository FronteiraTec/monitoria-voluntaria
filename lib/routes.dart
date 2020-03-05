import 'package:flutter/material.dart';
import 'package:monitoring/screens/list_teaching_assistance/all_teaching_assistence.dart';
import './screens/Login/sign_in_screen.dart';
//https://dart.dev/guides/language/effective-dart/style

//Each screen has its own "routeName", we need to use it to call the screen
//Each screen is registered in this file 
class Routes {
  static Map<String, Widget Function(dynamic)> build({@required BuildContext context}){
    //Place new routes here
    return {
    //  "/": (context) => AllTeachingAssitance(),
     "/": (context) => AllTeachingAssitance(),
     SignInScreen.routeName: (context) => new SignInScreen(),
    //  "/": (context) => new SignInScreen(),
     //Example.routeName: (context) => new Example(),
     //Example.routeName: (context) => new Example(),
    };
  }

}
