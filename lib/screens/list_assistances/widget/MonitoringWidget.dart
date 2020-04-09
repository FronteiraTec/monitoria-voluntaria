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

  // @override
  // void didChangeDependencies() {

  //   }

  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    // Provider.of<AssistanceProvider>(context, listen: false).clear();
    super.dispose();
  }

  var loading = true;
  var fetching = false;

  _scrollListener() async {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        fetching = true;
      });

      await Provider.of<AssistanceProvider>(context, listen: false)
          .fetchAssistances(context, ++_offset);

      await Future.delayed(Duration(milliseconds: 300));

      setState(() {
        fetching = false;
      });
    }
  }

  Future<void> _refreshProducts(BuildContext context) async {
    setState(() {
      loading = true;
    });

    Provider.of<AssistanceProvider>(context, listen: false).clear();
    await Provider.of<AssistanceProvider>(context, listen: false)
        .fetchAssistances(context, 0);

    await Future.delayed(Duration(milliseconds: 300));

    setState(() {
      loading = false;
    });
    _offset = 1;
    //  await Future.delayed(Duration(seconds: 5));

    // await Provider.of<ProducstsProvider>(context, listen: false).fetchAndSetProducts();
  }

  Future<void> executeAfterBuild() async {
    // this code will get executed after the build method
    // because of the way async functions are scheduled

    if (firstTime) {
      setState(() {
        loading = true;
      });

      Provider.of<AssistanceProvider>(context, listen: false).clear();
      await Provider.of<AssistanceProvider>(context, listen: false)
          .fetchAssistances(context, _offset++)
          .then((_) {
        setState(() {
          firstTime = false;
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    executeAfterBuild();

    return Expanded(
      child: Column(children: <Widget>[
        loading
            ? Expanded(child: Center(child: CircularProgressIndicator()))
            : Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    print("object");
                    _refreshProducts(context);
                  },
                  child: Consumer<AssistanceProvider>(
                    builder: (ctx, data, ch) => ListView.builder(
                      controller: _controller,
                      // physics: BouncingScrollPhysics(),
                      itemCount: data.items.length,
                      itemBuilder: (context, i) {
                        final assistance = data.items[i];
                        return ListItem(assistance: assistance);
                      },
                    ),
                  ),
                ),
              ),
        if (fetching)
          // Container(margin: EdgeInsets.only(bottom: 10, top: 10), child: CircularProgressIndicator()),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          )
      ]),
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

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(AssitanceDetailScreen.routeName,
              arguments: assistance);
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
            ],
          ),
        ),
      ),
    );
  }
}
