import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      child: SliverSafeArea(
        top: false,
        sliver: SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * .35,
          floating: false,
          forceElevated: false,
          pinned: true,
          title: Text("Ciência da computação"),
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              // title: Text("Ciência da computação",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18.0,
              //     )),
              background: Image.network(
                "https://www.amarula-electronics.com/files/amarula-electronics.com/2017/02/775-circuit-board-1920x1080-abstract-wallpaper.jpg?v=79cba1185463",
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
