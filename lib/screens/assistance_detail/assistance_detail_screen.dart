import "package:flutter/material.dart";
import '../../general_widgets/CustomDialog.dart';
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
          MySliverAppBar(assistance),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HorizontalCard(),
              AssistanceDetailText(assistanceDetail: assistance.description),
              UserProfileImage(assistance: assistance),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    Key key,
    @required this.assistance,
  }) : super(key: key);

  final Assistance assistance;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(left: 15),
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/avatarPlaceholder.jpg',
                  image: 'https://placekitten.com/400/400',
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    assistance.owner.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(assistance.course.name)
                ],
              ))
        ],
      ),
    );
  }
}


class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

//https://www.flaticon.com/br/icone-gratis/placeholder_148845 Pin Icon
//https://www.flaticon.com/br/icone-gratis/procurar_2489079?term=people&page=2&position=30 people icon
//https://www.flaticon.com/br/icone-gratis/calendario_2738407?term=calendar&page=1&position=11 calendar icon
//https://www.flaticon.com/br/icone-gratis/garantia_1156677?term=badge&page=1&position=59 badge
//https://www.flaticon.com/br/icone-gratis/relogio_129478?term=hour&page=1&position=11 glass
//https://www.flaticon.com/br/icone-gratis/notas_1355663?term=notebook&page=1&position=2 notebook
class HorizontalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _icons = [
      {
        "image": "assets/images/icons/watch.png",
        "function": () {
          showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(title: "Horário", description: "Teste de texto", buttonText: "Fechar", image: Image.asset("assets/images/icons/watch.png",)));
        }
      },
      {"image": "assets/images/icons/calendar.png", "function": () {
          showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(title: "Horário", description: "Teste de texto", buttonText: "Fechar", ));
        }},
      {"image": "assets/images/icons/location.png", "function": null},
      {"image": "assets/images/icons/notepad.png", "function": null},
      {"image": "assets/images/icons/people.png", "function": null},
      {"image": "assets/images/icons/badge.png", "function": null},
    ];

    return Container(
        height: 100.0,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _icons.length,
          itemBuilder: (ctx, i) => Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
            padding: const EdgeInsets.all(18),
            child: Container(
              width: 80,
              height: 80,
              child: InkWell(
                onTap: _icons[i]["function"],
                child: Image.asset(
                  _icons[i]["image"],
                ),
              ),
            ),
          ),
        ));
  }
}
