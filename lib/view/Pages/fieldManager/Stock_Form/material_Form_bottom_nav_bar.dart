import 'package:construction_aoo/view/Pages/IndexPage/constaints.dart';
import 'package:construction_aoo/view/Pages/fieldManager/Stock_Form/stock_data_table.dart';
import 'package:flutter/material.dart';


class MaterialBottomNavBar extends StatelessWidget {
  const MaterialBottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonNavItem(
            title: "Form",
            imgSrc: "lib/assets/images/materialForm.png",
            isActive:true,

          ),
          VerticalDivider(
            color: Colors.blueGrey[300],
            thickness: 2,
            indent: 5,
            endIndent: 5,
            width: 10,
          ),
          ButtonNavItem(
            title: "Table",
            imgSrc: "lib/assets/images/materialTable.png",
            press: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return stockDataTable();// View of table will be placed here
              }));
            },
          ),
        ],
      ),
    );
  }
}

class ButtonNavItem extends StatelessWidget {
  final String imgSrc;
  final String title;
  final Function press;
  final bool isActive;
  const ButtonNavItem({
    Key key,
    this.imgSrc,
    this.title,
    this.press,
    this.isActive=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 20),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.grey[400],
              ),
            ]),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:() {
              press();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: AssetImage(imgSrc),
                    width: 35.0,
                    height: 30.0,
                  ),
                  Text(title,
                    style:TextStyle(color: isActive ? KActionIconColor:KTextColor,
                        fontWeight:isActive ? FontWeight.bold : FontWeight.normal ,
                        fontSize: isActive ? 16:12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
