import 'package:flutter/material.dart';
import 'package:construction_aoo/view/Pages/IndexPage/mainMenu.dart';
import 'package:construction_aoo/view/Pages/loginPage/LoginPage.dart';
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({Key key,  this.text,  this.onClicked})
      : super(key: key);


  @override
  Widget build(BuildContext context) => Container(
        height:50.0,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        width: 320.0,
        child: Material(
          borderRadius: BorderRadius.circular(90.0),
          shadowColor: Color.fromARGB(220, 255, 153, 0),
          color: Color.fromARGB(220, 255, 153, 0),
          elevation: 10.0,
          child: GestureDetector(
            child: InkWell(
              highlightColor: Colors.orange.withOpacity(0.5),
              splashFactory: InkRipple.splashFactory,
              splashColor: Colors.yellow.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
              onTap: () {

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => menuPage()));
              },
              child: Center(
                child: Text('Login',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 25.0,
                    )),
              ),
            ),
          ),
        ),
      );
}
