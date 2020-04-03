import 'package:flutter/material.dart';

import '../../../models/assistanceModel.dart';

class MySliverAppBar extends StatelessWidget {
  final Assistance assistance;

  MySliverAppBar(this.assistance);

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
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            // collapseMode: CollapseMode.parallax,
            title: Text(assistance.title,
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 20.0,
                )),
            background: assistance.course.image,
          ),
        ),



      ),
    );
  }
}
