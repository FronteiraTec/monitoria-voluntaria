import 'package:flutter/material.dart';
import './user_photo_drawer.dart';

class MyDrawerHead extends StatelessWidget {
  final String username = "Maria Joaquina";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: DrawerHeader(
        child: Column(
          children: <Widget>[
            UserPhoto(),
            Divider(),
            Text(
              username,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
