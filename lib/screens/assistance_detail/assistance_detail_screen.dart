import "package:flutter/material.dart";
import './widgets/assistance_detail_bar.dart';
import './widgets/assistance_detail_text.dart';
import './widgets/my_sliver_app_bar.dart';
import './widgets/assistance_title_name.dart';

import '../../models/assistanceModel.dart';

class AssitanceDetailScreen extends StatelessWidget {
  static const routeName = "/oi";

  @override
  Widget build(BuildContext context) {
    final Assistance assistance = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.assignment),
        onPressed: () {
          //
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          MySliverAppBar(title:assistance.title),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AssistanceTitleName(assistanceName: assistance.title),
              // Divider(),
            
              AssistenceDetailBar(
                date: assistance.date.toString().substring(8, 10) + "/" + assistance.date.toString().substring(5, 7),
                hour: assistance.date.toString().substring(11, 16),
                local: "Local",
                numberOpenings: assistance.numberParticipants.toString(),
              ),

              UserProfile(),

              AssistanceDetailText(assistanceDetail: assistance.description),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 10, top: 1, right: 15),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Icon(Icons.account_circle),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Guilherme Sabino",
              style: TextStyle(fontSize: 18),
            ),
          ),

          Spacer(),
          Container(margin: EdgeInsets.only(right: 5), child: Icon(Icons.verified_user))
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Color.fromRGBO(220, 220, 220, 0.9), ),
          bottom: BorderSide(width: 1, color: Color.fromRGBO(220, 220, 220, 0.9)),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.12,
    );
  }
}
