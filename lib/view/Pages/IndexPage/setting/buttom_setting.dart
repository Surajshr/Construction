import 'package:flutter/material.dart';
class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            
            child: Text("Setting",style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),)
          ),
        ),
      ),
    );
  }
}
