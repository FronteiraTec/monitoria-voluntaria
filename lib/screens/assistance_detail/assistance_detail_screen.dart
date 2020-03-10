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
    var numberOpenings = "0";

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
              AssistenceDetailBar(
                date: date,
                hour: hour,
                local: local,
                numberOpenings: numberOpenings,
              ),
              AssistanceDetailText(assistanceDetail: assistanceDetail),
            ],
          ),
        ),
      ),
    );
  }
}
