import 'package:flutter/material.dart';
import 'package:monitoring/providers/assistanceProvider.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var _offset = 0;
  ScrollController _controller;

  void _scrollListener() {
    // print(_controller.offset);
    // print(_controller.offset >= _controller.position.maxScrollExtent);

    if (_controller.offset  >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
          print("fim");
          Provider.of<AssistanceProvider>(context, listen: false).fetchAssistances(context, ++_offset);
    }
 }

  @override
  void initState() {
    _controller = ScrollController();

    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final assistance = Provider.of<AssistanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("teste"),
      ),
      body: Center(
        child: FutureBuilder(
            future: Provider.of<AssistanceProvider>(context, listen: false)
                .fetchAssistances(context, 0),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<AssistanceProvider>(
                        builder: (ctx, data, child) => ListView.builder(
                          controller: _controller,
                            itemCount: data.items.length,
                            itemBuilder: (ctx, i) => Card(
                                  child: SizedBox(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(data.items[i].title, style: TextStyle(fontSize: 20),),
                                          SizedBox(height: 10),
                                          Text(data.items[i].date.toIso8601String(), style: TextStyle(fontSize: 15),),
                                          SizedBox(height: 10),
                                          Text(data.items[i].id.toString(), style: TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      )),
      ),
    );
  }
}
