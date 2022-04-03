import 'package:construction_aoo/view/Pages/IndexPage/setting/buttom_setting.dart';
import 'package:construction_aoo/view/Pages/IndexPage/today/callender.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constaints.dart';

class IndexBottomNavBar extends StatefulWidget {
  const IndexBottomNavBar({Key key}) : super(key: key);

  @override
  _IndexBottomNavBarState createState() => _IndexBottomNavBarState();
}

class _IndexBottomNavBarState extends State<IndexBottomNavBar> {
  DateTime date;

  String getText() {
    if (date == null) {
      return 'MM/dd/yy';
    } else {
      return DateFormat('MM/dd/yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonNavItem(
            title: "Today",
            imgSrc: "lib/assets/images/calendar.png",
            press: () {

              Navigator.push(context,MaterialPageRoute(builder: (context){
                return Callender();// should return method
              }));
            },
          ),
          ButtonNavItem(
            title: "Home",
            imgSrc: "lib/assets/images/house.png",
            isActive: true,
          ),

          ButtonNavItem(
            title: "Setting",
            imgSrc: "lib/assets/images/settings.png",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Setting(); // Should return method
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

