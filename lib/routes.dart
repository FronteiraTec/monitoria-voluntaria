import 'package:flutter/material.dart';
import 'package:monitoring/screens/Monitoring/Monitoring.dart';
import './screens/assistance_detail/assistance_detail_screen.dart';
import './screens/list_teaching_assistance/all_teaching_assistence_screen.dart';
import './screens/Login/sign_in_screen.dart';

//https://dart.dev/guides/language/effective-dart/style

//Each screen has its own "routeName", we need to use it to call the screen
//Each screen is registered in this file 
class Routes {
  static Map<String, Widget Function(dynamic)> build({@required BuildContext context}){
    //Place new routes here
    return {
     Monitoring.routeName: (context) => new Monitoring(),
     SignInScreen.routeName: (context) => new SignInScreen(),
     AssitanceDetailScreen.routeName: (ctx) => new AssitanceDetailScreen(),
     //Example.routeName: (context) => new Example(),
     //Example.routeName: (context) => new Example(),
    };
  }

}
