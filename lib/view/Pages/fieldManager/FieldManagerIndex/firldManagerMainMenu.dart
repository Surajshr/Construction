import 'package:construction_aoo/view/Pages/IndexPage/add_worker/attendence_list.dart';
import 'package:construction_aoo/view/Pages/IndexPage/side_bar_menue.dart';
import 'package:construction_aoo/view/Pages/fieldManager/FieldManagerIndex/field_Manager_Category.dart';
import 'package:construction_aoo/view/Pages/fieldManager/FieldManagerIndex/firld_manager_bottom_Nav_Bar.dart';
import 'package:construction_aoo/view/Pages/fieldManager/Stock_Form/stock_form_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class fieldManagerIndex extends StatefulWidget {
  const fieldManagerIndex({Key key}) : super(key: key);

  @override
  _fieldManagerIndexState createState() => _fieldManagerIndexState();
}

class _fieldManagerIndexState extends State<fieldManagerIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Field Manager"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: sideBarMenu(),
      ),
      bottomNavigationBar: fieldManagerBottomNavBar(),
      body: Stack(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: .85,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: fieldManagerCategoryCard(
                      title: "Monthly Plan",
                      imgScr: "lib/assets/images/monthlyPlan.png",
                      press: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: fieldManagerCategoryCard(
                      title: "Attendance",
                      imgScr: "lib/assets/images/attendence.png",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return IndexPage();
                        }));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: fieldManagerCategoryCard(
                    title: "Stock",
                    imgScr: "lib/assets/images/Stock.png",
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MaterialForm();
                      }));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
