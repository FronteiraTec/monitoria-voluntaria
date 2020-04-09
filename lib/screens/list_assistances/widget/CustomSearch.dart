import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate<String> {
   @override
  String get searchFieldLabel => "Buscar";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Exatas", style: TextStyle(fontSize: 16),),
              ),
              HorizontalCard(),
              SizedBox(height: 10),

             Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Humanas", style: TextStyle(fontSize: 16),),
              ),
              HorizontalCard(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Biologicas", style: TextStyle(fontSize: 16),),
              ),
              HorizontalCard(),

              Row(
                children: <Widget>[
                  Checkbox(value: true, onChanged: null),
                  Text("Ocultar sem vagas"),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(value: true, onChanged: null),
                  Text("Ocultar sem vagas"),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(value: true, onChanged: null),
                  Text("Ocultar sem vagas"),
                ],
              )

            ],
          ),
        ),
      ),
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