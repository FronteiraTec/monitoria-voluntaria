import 'package:flutter/material.dart';
import './drawer_widgets/drawer_head.dart';
import './drawer_widgets/drawer_link.dart';

import 'package:monitoring/screens/Login/sign_in_screen.dart';
import '../../general_widgets/custom_icons.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.86, //20.0,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                MyDrawerHead(),
                Container(
                  margin: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width * 0.38) / 2),
                  // padding: EdgeInsets.only(top: 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DrawerLink(name: "Monitorias", routeName: "/", icon: CustomIcons.calendar),
                      DrawerLink(name: "Oi", routeName: "/oi", icon: CustomIcons.database),
                      DrawerLink(name: "Link 3", routeName: "/", icon: CustomIcons.note),
                      DrawerLink(name: "Link 4", routeName: "/", icon: CustomIcons.pencil),
                      DrawerLink(name: "Entrar", routeName: SignInScreen.routeName, icon: CustomIcons.mail),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
