import 'package:flutter/material.dart';
import './user_photo_drawer.dart';

class MyDrawerHead extends StatelessWidget {
  final String username = "Maria Joaquina";
  final String userId = "Fersasil";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
               // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xFF398783),
                const Color(0xFF1b582e)
              ], // whitish to gray
              // repeats the gradient over the canvas
            ),
            
          ),
      height: MediaQuery.of(context).size.height * .33,
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(width: 110, height: 110, child: UserPhoto()),
            SizedBox(
              height: 20,
            ),

            Text(
              username,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 2),
            Container(
              margin: EdgeInsets.only(top: 3.5),
              child: Text(
                "@$userId",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        // decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
