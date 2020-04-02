import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final String title;

  const MySliverAppBar({
    Key key,
    this.title,
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
        title: Text(title),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_highlight.png',
              image:
                  "https://www.amarula-electronics.com/files/amarula-electronics.com/2017/02/775-circuit-board-1920x1080-abstract-wallpaper.jpg?v=79cba1185463",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
