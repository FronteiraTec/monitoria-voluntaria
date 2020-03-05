import 'package:flutter/material.dart';
import './drawer_widgets/drawer_head.dart';
import './drawer_widgets/drawer_link.dart';


import 'package:monitoring/screens/Login/sign_in_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6, //20.0,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            MyDrawerHead(),
            DrawerLink(name: "Monitorias", routeName: "/", icon: Icons.book),
            DrawerLink(name: "Link 2", routeName: "/"),
            DrawerLink(name: "Link 3", routeName: "/"),
            DrawerLink(name: "Link 4", routeName: "/"),
            DrawerLink(name: "Entrar", routeName: SignInScreen.routeName, icon: Icons.verified_user),
          ],
        ),
      ),
    );
  }
}
