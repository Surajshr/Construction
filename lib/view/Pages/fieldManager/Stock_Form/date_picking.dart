import 'package:flutter/material.dart';

class ButtonHeaderidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderidget(
      {Key key,
        @required this.title,
        @required this.text,
        @required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ButtonWidget(
    text: text,
    onClicked: onClicked,
  );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton.icon(
    style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50),
        primary: Colors.white,
        side: BorderSide(color: Colors.grey),
        alignment: Alignment.center),
    icon: Icon(
      Icons.calendar_today_outlined,
      color: Colors.orange,
    ),
    label: FittedBox(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.normal),
      ),
    ),
    onPressed: onClicked,
  );
}
