import 'package:flutter/material.dart';

class AssistanceTitleName extends StatelessWidget {
  const AssistanceTitleName({
    Key key,
    @required this.assistanceName,
  }) : super(key: key);

  final String assistanceName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        child: Text(
          assistanceName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

