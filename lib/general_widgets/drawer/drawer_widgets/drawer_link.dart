import "package:flutter/material.dart";

class DrawerLink extends StatelessWidget {
  final String routeName;
  final String name;
  final Color iconColor;
  final IconData icon;
  

  const DrawerLink({@required this.routeName, @required this.name, this.icon, this.iconColor});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 10),
      child: InkWell(
        onTap: (){
           Navigator.pop(context);

        Navigator.of(context).pushReplacementNamed(routeName);
        },
              child: Container(
                width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon != null ? icon : Icons.description),
              SizedBox(width: 25),
              Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),)
            ],),
        ),
      ),
    );
  }
}
