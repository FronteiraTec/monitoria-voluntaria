import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes.dart';
import './theme.dart';

import './providers/assistanceProvider.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AssistanceProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        routes: Routes.build(context),
      ),
    );
  }
}
