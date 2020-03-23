import "package:flutter/material.dart";
import './widgets/assistance_detail_bar.dart';
import './widgets/assistance_detail_text.dart';
import './widgets/my_sliver_app_bar.dart';
import './widgets/assistance_title_name.dart';

class AssitanceDetailScreen extends StatelessWidget {
  static const routeName = "/oi";

  @override
  Widget build(BuildContext context) {
    var assistanceName = "Monitoria de Algoritmos";
    var assistanceDetail =
        "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.";

    var date = "17/02";
    var hour = "13:00";
    var local = "UFFS";
    var numberOpenings = "5";

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
          MySliverAppBar(),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AssistanceTitleName(assistanceName: assistanceName),
              // Divider(),
              AssistenceDetailBar(
                date: date,
                hour: hour,
                local: local,
                numberOpenings: numberOpenings,
              ),

              UserProfile(),

              AssistanceDetailText(assistanceDetail: assistanceDetail),
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
