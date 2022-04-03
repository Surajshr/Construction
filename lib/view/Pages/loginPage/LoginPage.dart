// import 'package:construction_aoo/view/Layouts/navbar.dart';

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:construction_aoo/view/Pages/IndexPage/mainMenu.dart';
import 'package:http/http.dart' as http;
// import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'mainMenu.dart';
import 'RegisterPage.dart';

class ConstructionApp extends StatelessWidget {
  static final String title = "Construction";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.amber,
        fontFamily: 'montserrat'
      ),
      home: LoginPage(title: title),
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  bool processing = false;

  // String email = '';
  // String password = '';
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  clearTextField() {
    _email.text = "";
    _password.text = "";
  }

  Future<List> login() async {
    var url = "http://192.168.1.70:8080/projectAPI/flutter/projectAPI/login.php";
    var response = await http
        .post(url, body: {"email": _email.text, "password": _password.text});
    var dataUsers = json.decode(response.body);
    if (dataUsers.length == 1) {
      //if there is a data in dataUsers ,length will be 1 otherwise 0
      //Then Go to home page

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => menuPage()));
    } else {
      showAlertToast();
      clearTextField();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size;
    return Container(

        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bwCons.png"),
        height: size.height * .45,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.dstATop),
                image: AssetImage("lib/assets/images/loginImg.png"),
                // NetworkImage(
                //     "https://cdn.pixabay.com/photo/2018/10/15/23/42/industrial-3750300_960_720.png"),
                //image: AssetImage('assets/images/bwInsustry.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                    padding:
                        EdgeInsets.only(top: 330.0, left: 20.0, right: 20.0),
                    // EdgeInsets.symmetric(horizontal: 30, vertical: 300),
                    child: Form(
                      key: formKey,
                      child: ListView(
                        padding: EdgeInsets.all(20),
                        children: [
                          buildEmail(),
                          const SizedBox(height: 32),
                          buildPassword(),
                          const SizedBox(height: 10),
                          buildForgotPassword(),
                          const SizedBox(height: 32),

                          // login button
                          Container(
                            height: 50.0,
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            width: 320.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(90.0),
                              shadowColor: Color.fromARGB(220, 255, 153, 0),
                              color: Color.fromARGB(220, 255, 153, 0),
                              elevation: 10.0,
                              child: GestureDetector(
                                child: InkWell(
                                  highlightColor:
                                      Colors.orange.withOpacity(0.5),
                                  splashFactory: InkRipple.splashFactory,
                                  splashColor: Colors.yellow.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    //used to validate a form when we click a login button
                                    if (formKey.currentState.validate()) {
                                      login();
                                    } else {
                                      print("Not Validate");
                                    }
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
                          ),
                          const SizedBox(height: 62),
                        ],
                      ),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 140.0, 0.0, 0.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors
                            .amber.shade600), //ffc107 which is kinda yellow
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(240, 80.0, 0.0, 0.0),
                    child: Text(
                      '!',
                      style: TextStyle(
                          fontSize: 160.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.amber),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 760.0, 0.0, 0.0),
                  child: Text('New to Construction?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.00,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ),
                Container(
                    padding: EdgeInsets.only(top: 760.0, left: 225.0),
                    // padding: EdgeInsets.fromLTRB(225.0, 760.0, 0.0, 5.0),
                    child: InkWell(
                        highlightColor: Colors.orange.withOpacity(0.5),
                        splashFactory: InkRipple.splashFactory,
                        splashColor: Colors.yellow.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(2),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => registerPage()));
                        },
                        child: Text('Register Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.00,
                              // color: Color.fromARGB(220, 255, 153, 0),
                              color: Colors.amber,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ))))
              ],
            )));
  }

  Widget buildEmail() => TextFormField(
        controller: _email,
        decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 30),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(220, 255, 153, 0)))),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (String value) {
          //put Validation over here..
          if (value == null || value.trim().length == 0) {
            return "Field is required";
          }
          if (!RegExp(r"^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$").hasMatch(value)) {
            return "Please Enter Valid email Address";
          }
          return null;
        },
        onSaved: (value) {},
      );

  Widget buildPassword() => TextFormField(
        controller: _password,
        obscureText: true,
        decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            labelText: 'Password',
            prefixIcon: Icon(Icons.vpn_key_sharp),
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 30),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(220, 255, 153, 0)))),
        textInputAction: TextInputAction.next,
        validator: (String value) {
          //put Validation over here..
          if (value == null || value.trim().length == 0) {
            return "Field is required";
          }
          if (value.length <= 6) {
            return "Password should not be less then 6 characters";
          }
          return null;
        },
        onSaved: (value) {},
      );

  Widget buildForgotPassword() => Container(
        padding: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
        alignment: Alignment(1.0, 0.0),
        //padding: EdgeInsets.only(top: 15, left: 20.0),
        child: InkWell(
          highlightColor: Colors.orange.withOpacity(0.5),
          splashFactory: InkRipple.splashFactory,
          splashColor: Colors.yellow.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Text(
            'Forgot Password',
            style: TextStyle(
                // color: Color.fromARGB(220, 255, 153, 0),
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                decoration: TextDecoration.underline,
                fontSize: 20.0),
          ),
        ),
      );



  showAlertToast() {
    Fluttertoast.showToast(
        msg: 'Invalid email or password...!!!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }
}

// Widget buildSubmit() => Builder(
//     builder: (context) => ButtonWidget(text: 'Login', onClicked: () {}));
