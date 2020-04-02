import 'package:flutter/material.dart';
import './user_photo_drawer.dart';

class MyDrawerHead extends StatelessWidget {
  final String username = "Maria Joaquina";
  final String userId = "Fersasil";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: UserPhoto()),
            Divider(
              height: 20,
            ),

            Text(
              username,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 3.5),
              child: Text(
                "@$userId",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
