import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../providers/assistanceProvider.dart';
import '../../../general_widgets/drawer/drawer.dart';
import '../../../screens/assistance_detail/assistance_detail_screen.dart';
import '../../../models/assistanceModel.dart';

import './CustomSearch.dart';

class MonitoringWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Monitorias"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showSearch(context: context, delegate: CustomSearch());
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            // HorizontalCard(),
            ScrollableList(),
          ],
        ),
      ),
    );
  }
}

class ScrollableList extends StatefulWidget {
  @override
  _ScrollableListState createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
  var _offset = 0;
  ScrollController _controller;
  var firstTime = true;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (firstTime) {
      Provider.of<AssistanceProvider>(context, listen: false).clear();
      firstTime = false;
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      Provider.of<AssistanceProvider>(context, listen: false)
          .fetchAssistances(context, ++_offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _offset == 0
            ? Provider.of<AssistanceProvider>(context, listen: false)
                .fetchAssistances(context, _offset++)
            : Future.delayed(Duration(seconds: 0)),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                );
              } else {
                return Consumer<AssistanceProvider>(
                  builder: (ctx, data, ch) => ListView.builder(
                    controller: _controller,
                    itemCount: data.items.length,
                    itemBuilder: (context, i) {
                      final assistance = data.items[i];
                      return ListItem(assistance: assistance);
                    },
                  ),
                );
              }
          }
          //TODO: implement this return
          return Container();
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Assistance assistance;

  const ListItem({
    Key key,
    @required this.assistance,
  }) : super(key: key);

  String get numericDate {
    return DateFormat('dd/mm', 'pt_BR').format(assistance.date);
  }

  List<Color> getColor(id) {
    final number = id % 10;
    switch (number) {
      case 0:
        return [const Color(0xFFab7bbd), const Color(0xFF27ab50)];
      case 1:
        return [const Color(0xFF3A1C71), const Color(0xFFD76D77), const Color(0xFFFFAF7B)];
        case 2:
        return [const Color(0xFF283c86), const Color(0xFF45a247)];
        case 3:
        return [const Color(0xFFEF3B36), const Color(0xFFFFFFFF)];
        case 4:
        return [const Color(0xFFc0392b), const Color(0xFF8e44ad)];
        case 5:
        return [const Color(0xFF159957), const Color(0xFF155799)];
        case 6:
        return [const Color(0xFF000046), const Color(0xFF1CB5E0)];
        case 7:
        return [const Color(0xFF007991), const Color(0xFF78ffd6)];
        case 8:
        return [const Color(0xFFF2994A), const Color(0xFFF2C94C)];
        case 9:
        return [const Color(0xFF30E8BF), const Color(0xFFFF8235)];
      default:
        return [const Color(0xFFD66D75), const Color(0xFFD66D75)];
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    // return InkWell(
    //   onTap: () {
    //     print(assistance.id % 10);
    //   },
    //       child: Container(
    //     margin: EdgeInsets.only(bottom: 10, top: 10),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(13.0),
    //       gradient: LinearGradient(
    //           begin: Alignment.topCenter,
    //           end: Alignment.bottomCenter,
    //           // 10% of the width, so there are ten blinds.
    //           colors: getColor(assistance.id) // whitish to gray
    //           // repeats the gradient over the canvas
    //           ),
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Padding(
    //           padding: const EdgeInsets.only(top: 18, left: 18, bottom: 5),
    //           child: Text(
    //             assistance.title,
    //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
    //           ),
    //         ),

    //         Padding(
    //           padding: const EdgeInsets.only(left: 18, bottom: 18),
    //           child: Text(
    //             assistance.course.name,
    //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
           Navigator.of(context)
              .pushNamed(AssitanceDetailScreen.routeName, arguments: assistance);
        },
            child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 18, bottom: 5),
                  child: Text(
                    assistance.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 18),
                  child: Text(
                    assistance.course.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, bottom: 8),
                //   child: Text(
                //     numericDate,
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                //   ),
                // ),
              ],
            )),
      ),
    );
    // // return ListTile(
    //   title: Text(
    //     assistance.title,
    //     style: TextStyle(fontSize: 18),
    //   ),
    //   subtitle: Text(
    //     "${assistance.id} Data: ${assistance.date.day.toString()}/${assistance.date.month.toString()}/${assistance.date.year.toString()}\nHora: ${assistance.date.hour.toString()}:${assistance.date.minute.toString()}",
    //     style: TextStyle(fontSize: 16),
    //   ),
    //   onTap: () {
    //     Navigator.of(context)
    //         .pushNamed(AssitanceDetailScreen.routeName, arguments: assistance);
    //   },
    // );
  }
}

class HorizontalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (int index) => Card(
            color: Colors.blue[index * 100],
            child: Container(
              width: 50.0,
              height: 50.0,
              child: Text("$index"),
            ),
          ),
        ),
      ),
    );
  }
}
