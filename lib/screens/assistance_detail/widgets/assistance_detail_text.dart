import 'package:flutter/material.dart';

class AssistanceDetailText extends StatelessWidget {
  const AssistanceDetailText({
    Key key,
    @required this.assistanceDetail,
  }) : super(key: key);

  final String assistanceDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(3),
      width: double.infinity,
      child: Text(
        assistanceDetail,
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}