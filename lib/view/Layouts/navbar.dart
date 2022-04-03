import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class navbar extends StatelessWidget {
  const navbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Construction',
      theme: ThemeData(primarySwatch: Colors.amber),
      color: Colors.amber,
    );
  }
}

class appNavBar extends AppBar {
  appNavBar({Key key, Widget title})
      : super(
      key: key,
      title: title,
      actions: <Widget>[new Icon(Icons.view_headline)]);
}
