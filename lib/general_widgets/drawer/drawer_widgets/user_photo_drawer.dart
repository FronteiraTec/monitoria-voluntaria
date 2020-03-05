import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      child: ClipOval(
        child: Image.network(
          "https://smk.org.uk/wp-content/uploads/avatar.jpg",
        ),
      ),
    );
  }
}
