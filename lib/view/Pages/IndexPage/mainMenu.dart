import 'package:construction_aoo/view/Pages/Engineer/engineerDashBoard.dart';
import 'package:construction_aoo/view/Pages/IndexPage/Index_Buttom_Navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'index_category_card.dart';
import 'constaints.dart';
import 'side_bar_menue.dart';
import 'package:construction_aoo/view/Pages/fieldManager/FieldManagerIndex/firldManagerMainMenu.dart';

class menuPage extends StatelessWidget {
  const menuPage({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: KbackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: KTextColor),
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Construction"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: sideBarMenu(),
      ),
      bottomNavigationBar: IndexBottomNavBar(),
      body: Stack(
        children: [
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .85,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CategoryCard(
                    title: "Engineer",
                    imgScr: "lib/assets/images/enginer.png",
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return engineerDashBoard();
                      }));
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CategoryCard(
                  title: "Field Manager",
                  imgScr: "lib/assets/images/manager.png",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return fieldManagerIndex();
                    }));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
