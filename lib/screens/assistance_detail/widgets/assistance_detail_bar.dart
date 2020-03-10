import 'package:flutter/material.dart';

class AssistenceDetailBar extends StatelessWidget {
  final String local;
  final String numberOpenings;
  final String date;
  final String hour;

  const AssistenceDetailBar({
    Key key,
    @required this.local,
    @required this.numberOpenings,
    @required this.date,
    @required this.hour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .09,
        width: double.infinity,
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Color.fromRGBO(220, 220, 220, 0.2),
          // border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AppItem(icon: Icons.schedule, text: hour, onTap: (){
              //
            }),
            AppItem(icon: Icons.people, text: numberOpenings, onTap: (){
              //
            }),
            AppItem(icon: Icons.place, text: local, onTap: () {
              //
            }),
            AppItem(icon: Icons.event_available, text: date, onTap: (){
              //
            }),
          ],
        ),
    );
  }
}

class AppItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const AppItem({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
          child: Row(
        children: <Widget>[
          Icon(this.icon),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(this.text),
          ),
        ],
      ),
    );
  }
}
