import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import '../../helpers/MapUtils.dart';
import '../../general_widgets/CustomDialog.dart';
import './widgets/assistance_detail_text.dart';
import './widgets/my_sliver_app_bar.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/assistanceModel.dart';

class AssitanceDetailScreen extends StatelessWidget {
  static const routeName = "/assistance-detail";

  @override
  Widget build(BuildContext context) {
    final Assistance assistance = ModalRoute.of(context).settings.arguments;

    // final _scaffoldKey = GlobalKey();
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton:
          FloatAction(assistance: assistance, scaffoldKey: _scaffoldKey),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          MySliverAppBar(assistance),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HorizontalCard(assistance),
              AssistanceDetailText(assistanceDetail: assistance.description),
              UserProfileImage(assistance: assistance),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatAction extends StatefulWidget {
  FloatAction({
    Key key,
    @required this.assistance,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final Assistance assistance;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _FloatActionState createState() => _FloatActionState();
}

class _FloatActionState extends State<FloatAction> {
  var _visible = true;

  void _showFloatAction() {
    setState(() {
      _visible = true;
    });
  }

  void _disableFloatAction() {
    setState(() {
      _visible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: FloatingActionDialog(
        scaffoldKey: widget._scaffoldKey,
        title: widget.assistance.title,
        show: _showFloatAction,
        disable: _disableFloatAction,
      ),
    );
  }
}

class FloatingActionDialog extends StatelessWidget {
  const FloatingActionDialog(
      {Key key,
      @required this.show,
      @required this.disable,
      @required this.title,
      @required this.scaffoldKey})
      : super(key: key);

  final Function show;
  final Function disable;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //https://www.flaticon.com/br/icone-gratis/bate-papo_1657306?term=yes&page=1&position=15
      child: Image.asset("assets/images/icons/assign.png"),
      onPressed: () {
        showDialog(
          context: context,
          child: Dialog(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Consts.padding),
            ),
            child: Container(
              child: Container(
                height: 250,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 15.0, right: 15.0, bottom: 15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Inscrever-se",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Você esta se inscrevendo na monitoria de ${title}, deseja continuar?",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, wordSpacing: 2),
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog');

                                  void _displaySnackBar(BuildContext context) {
                                    final snackBar = SnackBar(
                                      content:
                                          Text('Você foi inscrito com sucesso'),
                                      action: SnackBarAction(
                                          label: "Desfazer",
                                          onPressed: () {
                                            show();
                                            return;
                                          }),
                                    );

                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }

                                  _displaySnackBar(context);

                                  disable();
                                },
                                icon: Icon(Icons.check),
                                iconSize: 50,
                                color: Colors.black54,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog');
                                },
                                icon: Icon(Icons.cancel),
                                iconSize: 50,
                                color: Colors.black54,
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
  static const double iconPadding = 18.0;
  static const double iconVerticalMargin = 16.0;
  static const double iconHorizontalMargin = 12.0;
}

//https://www.flaticon.com/br/icone-gratis/placeholder_148845 Pin Icon
//https://www.flaticon.com/br/icone-gratis/procurar_2489079?term=people&page=2&position=30 people icon
//https://www.flaticon.com/br/icone-gratis/calendario_2738407?term=calendar&page=1&position=11 calendar icon
//https://www.flaticon.com/br/icone-gratis/garantia_1156677?term=badge&page=1&position=59 badge
//https://www.flaticon.com/br/icone-gratis/relogio_129478?term=hour&page=1&position=11 glass
//https://www.flaticon.com/br/icone-gratis/notas_1355663?term=notebook&page=1&position=2 notebook

class IconsInfo {
  Image image;
  final String title, description, imageUrl;
  String buttonText;
  Widget descriptionWidget, titleWidget, secondButtonWidget;

  IconsInfo(
      {@required this.imageUrl,
      @required this.title,
      this.description,
      this.buttonText = "Fechar",
      this.descriptionWidget,
      this.secondButtonWidget}) {
    this.image = Image.asset(this.imageUrl);
  }

  void openDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: title,
        description: description,
        buttonText: buttonText,
        descriptionWidget: descriptionWidget,
        titleWidget: titleWidget,
        image: image,
        secondButtonWidget: secondButtonWidget,
      ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final Assistance assistance;

  HorizontalCard(this.assistance);

  String get numericDate {
    return DateFormat('dd/mm/yyyy', 'pt_BR').format(assistance.date);
  }

  String get wordDate {
    var day = DateFormat('EEEEE', 'pt_BR').format(assistance.date);
    var numericDay = DateFormat('dd', 'pt_BR').format(assistance.date);

    final month = DateFormat('MMMM', 'pt_BR').format(assistance.date);
    final year = DateFormat('yyyy', 'pt_BR').format(assistance.date);

    day = ('${day[0].toUpperCase()}${day.substring(1)}');

    return "$day, $numericDay $month de $year";
  }

  String get parsedTime {
    return DateFormat.Hm("pt_BR").format(assistance.date);
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    final _icons = [
      if (assistance.owner.verifiedAssistant)
        IconsInfo(
            imageUrl: "assets/images/icons/badge.png",
            title: "Oficial",
            description: "Monitor certificado pela universidade."),
      IconsInfo(
          imageUrl: "assets/images/icons/watch.png",
          title: "Horário",
          descriptionWidget: Column(
            children: <Widget>[
              Text(parsedTime,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              Text("Cuidado para não se atrasar.",
                  style: TextStyle(fontSize: 16))
            ],
          )),
      IconsInfo(
        imageUrl: "assets/images/icons/calendar.png",
        title: "Data",
        descriptionWidget: Column(
          children: <Widget>[
            Text(wordDate, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(numericDate, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      IconsInfo(
          imageUrl: "assets/images/icons/location.png",
          title: "Localização",
          secondButtonWidget: FlatButton.icon(
              onPressed: () {
                MapUtils.openMap(assistance.location.latitude, assistance.location.longitude);
              },
              icon: Icon(Icons.map),
              label: Text("Abrir no mapa")),
          descriptionWidget: Container(
            // alignment: Alignment.bottomRight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(assistance.location.nickname,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  Text("Rua: ${assistance.location.street}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Número: ${assistance.location.number}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text(assistance.location.complement,
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                ]),
          )),
      IconsInfo(
          imageUrl: "assets/images/icons/people.png",
          title: "Vagas",
          descriptionWidget: Column(
            children: <Widget>[
              Text("Disponíveis: ${assistance.numberParticipants}",
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text("Total: 30", style: TextStyle(fontSize: 18)),
            ],
          )),
      IconsInfo(
          imageUrl: "assets/images/icons/notepad.png",
          title: "Dicas",
          description:
              "Chegue sempre com antecendencia.\nEvite faltar nas monitorias.\nSempre respeite o monitor.\nSe divirta aprendendo."),
    ];

    return Container(
        height: 100.0,
        margin: const EdgeInsets.symmetric(vertical: Consts.iconVerticalMargin),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _icons.length,
          itemBuilder: (ctx, i) => Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0x20c4ffc4)),
            padding: const EdgeInsets.all(Consts.iconPadding),
            child: Container(
              width: 80,
              height: 80,
              child: InkWell(
                onTap: () {
                  _icons[i].openDialog(context);
                },
                child: _icons[i].image,
              ),
            ),
          ),
        ));
  }
}
