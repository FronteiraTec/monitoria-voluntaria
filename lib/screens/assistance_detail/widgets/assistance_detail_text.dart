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
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      padding: const EdgeInsets.all(5.0),
      width: double.infinity,
      child: Text(
        assistanceDetail,
        style: TextStyle(fontSize: 19),
      ),
    );
  }
}