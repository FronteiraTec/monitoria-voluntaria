import 'package:flutter/material.dart';
import 'package:monitoring/models/assistanceModel.dart';
import 'package:provider/provider.dart';

import '../../../providers/assistanceProvider.dart';
import '../../../general_widgets/drawer/drawer.dart';
import '../../../screens/assistance_detail/assistance_detail_screen.dart';
import './CustomSearch.dart';

class MonitoringWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Monitoring"),
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            HorizontalCard(),
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
  // final String _search;
  var _offset = 0;
  ScrollController _controller;

  _scrollListener() {
     if (_controller.offset  >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
          Provider.of<AssistanceProvider>(context, listen: false).fetchAssistances(++_offset);
          print("fim");
        }
      else if((_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange)){
          print("Inicio");
          Provider.of<AssistanceProvider>(context, listen: false).fetchAssistances(--_offset);

        }
 }
@override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose(){
    _controller.removeListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _offset == 0 ? Provider.of<AssistanceProvider>(context, listen: false)
            .fetchAssistances(_offset++) : Future.delayed(Duration(seconds: 0)),
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
          return Container();
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.assistance,
  }) : super(key: key);

  final Assistance assistance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(assistance.title),
      subtitle: Text(
          "${assistance.id} Data: ${assistance.date.day.toString()}/${assistance.date.month.toString()}/${assistance.date.year.toString()}\nHora: ${assistance.date.hour.toString()}:${assistance.date.minute.toString()}"),
      onTap: () {
        Navigator.of(context).pushNamed(
            AssitanceDetailScreen.routeName,
            arguments: assistance);
      },
    );
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
