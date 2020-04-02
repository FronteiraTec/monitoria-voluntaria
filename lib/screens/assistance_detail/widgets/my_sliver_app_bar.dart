import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Image image;

  const MySliverAppBar({
    Key key,
    @required this.imageUrl,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var fadeInImage = FadeInImage.assetNetwork(
    //           placeholder: 'assets/images/placeholder_highlight.png',
    //           image: imageUrl,
    //           fit: BoxFit.cover,
    //         );
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
            background: image,//fadeInImage,
          ),
        ),
      ),
    );
  }
}
