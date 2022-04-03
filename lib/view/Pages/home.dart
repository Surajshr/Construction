// import 'package:construction_aoo/Services/registerUser.dart';
import 'package:flutter/material.dart';

class FrontP extends StatelessWidget {
  const FrontP({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Construction',
      home: FrontPage(),
    );
  }
}

class FrontPage extends StatefulWidget {
  const FrontPage({Key key}) : super(key: key);

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // In this page we are keeping login and register button with bg image
        ],
      ),
    );
  }
}



