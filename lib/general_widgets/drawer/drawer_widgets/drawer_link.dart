import "package:flutter/material.dart";

class DrawerLink extends StatelessWidget {
  final String routeName;
  final String name;
  final Color iconColor;
  final IconData icon;
  

  const DrawerLink({@required this.routeName, @required this.name, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          icon == null ? Icons.not_interested : icon,
          color: iconColor == null ? Colors.black38 : iconColor,
        ),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        Navigator.pop(context);

        Navigator.of(context).pushNamed(routeName);
      },
    );
  }
}
