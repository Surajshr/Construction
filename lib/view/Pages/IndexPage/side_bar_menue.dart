import 'package:construction_aoo/view/Pages/IndexPage/about_Us.dart';
import 'package:construction_aoo/view/Pages/IndexPage/add_worker/worker_add.dart';
import 'package:construction_aoo/view/Pages/IndexPage/calculator/cal_main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../loginPage/LoginPage.dart';
import '../add_worker.dart';

class sideBarMenu extends StatelessWidget {
  const sideBarMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Suraj Shrestha"),
          accountEmail: Text("suraj@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('lib/assets/images/person.jpg'),
            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.amber
                : Colors.white,
          ),
        ),
        ListTile(
            title: Text("Add Worker"),
            trailing: Icon(Icons.person, color: Colors.black),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => addWorkerPage()));
            }),
        ListTile(
            title: Text("Salary"),
            trailing: Icon(Icons.money, color: Colors.black),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => NewPage("page Two")));
            }),
        ListTile(
            title: Text("Calculator"),
            trailing: Icon(Icons.calculate_rounded, color: Colors.black),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CalcApp()));
            }),
        Divider(),
        ListTile(
          title: Text("About Us"),
          trailing: Icon(Icons.accessibility_new_rounded, color: Colors.black),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AboutUs()));
          },
        ),
        ListTile(
            title: Text("LogOut"),
            trailing: Icon(Icons.exit_to_app, color: Colors.red),
            // onTap:()=>  Navigator.of(context).pop(),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()));
            })
      ],
    );
  }
}
