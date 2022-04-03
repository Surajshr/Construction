import 'package:flutter/material.dart';
import 'constaints.dart';

class CategoryCard extends StatelessWidget {
  final String imgScr;
  final String title;
  final Function press;

  const CategoryCard({Key key, this.imgScr, this.title, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: 10,
              color: KShadowColor,
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.orange[200].withOpacity(0.2),
            splashColor: Colors.orange.withOpacity(0.5),
            onTap: () {
              press();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(imgScr),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15, color: Colors.orange[300]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
