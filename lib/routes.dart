import 'package:flutter/material.dart';
import './screens/list_assistances/list_assistances_screen.dart';
import './screens/assistance_detail/assistance_detail_screen.dart';
import './screens/Login/sign_in_screen.dart';

//https://dart.dev/guides/language/effective-dart/style

//Each screen has its own "routeName", we need to use it to call the screen
//Each screen is registered in this file
class Routes {
  static Map<String, Widget Function(dynamic)> build(BuildContext context) {
    //Place new routes here
    return {
      ListAssistancesScreen.routeName: (context) => new ListAssistancesScreen(),
      SignInScreen.routeName: (context) => new SignInScreen(),
      AssitanceDetailScreen.routeName: (ctx) => new AssitanceDetailScreen(),
      //  Test.routeName: (context) => Test(),
      //Example.routeName: (context) => new Example(),
    };
  }
}
