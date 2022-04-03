import 'dart:convert';

import 'package:construction_aoo/view/Pages/loginPage/LoginPage.dart';
import 'package:construction_aoo/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:construction_aoo/view/Pages/loginPage/model/register_user_services.dart';

import '../IndexPage/mainMenu.dart';

class registerPage extends StatelessWidget {
  const registerPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Construction",
      home: register(),
    );
  }
}

class register extends StatefulWidget {
  const register({Key key}) : super(key: key);

  @override
  registerState createState() => registerState();
}

class registerState extends State<register> {
  final formKey = GlobalKey<FormState>();
  bool processing = false;

  TextEditingController _regEmailController ;
  TextEditingController _regPasswordController ;
  TextEditingController _regFirstNameController ;
  TextEditingController _regLastNameController ;

  clearTextField() {
    _regEmailController.text = "";
    _regPasswordController.text = "";
    _regFirstNameController.text = "";
    _regLastNameController.text = "";
  }

  void initState(){
    super.initState();
    _regEmailController = TextEditingController();
    _regPasswordController = TextEditingController();
    _regFirstNameController = TextEditingController();
    _regLastNameController = TextEditingController();
  }
  // Future<List> registerPa() async {
  //   var url = "http://192.168.1.70:8080/projectAPI/login.php";
  //   var response = await http.post(url, body: {
  //     "firstName": _regFirstName.text,
  //     "lastName": _regLastName.text,
  //     "email": _regEmail.text,
  //     "password": _regPassword.text,
  //   });
  //   var dataUsers = json.decode(response.body);
  //   if (dataUsers.length == 1) {
  //     //if there is a data in dataUsers ,length will be 1 otherwise 0
  //     //Then Go to home page
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => menuPage()));
  //   } else {
  //     showAlertDialog(context);
  //     clearTextField();
  //   }
  // }
  _regesterUser(){
    if(_regEmailController.text.isEmpty ||
        _regPasswordController.text.isEmpty ||
        _regFirstNameController.text.isEmpty ||
        _regLastNameController.text.isEmpty ){
      print('Empty Fields');
      return;
    }
    userServices.addUser(
        _regEmailController.text,
        _regFirstNameController.text,
        _regLastNameController.text,
      _regPasswordController.text
    ).then((result){
      if('success'== result){
        print('user registered');
        clearTextField();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade400,
      // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bwCons.png"),

        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.dstATop),
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2018/10/15/23/42/industrial-3750300_960_720.png"),
                //image: AssetImage('assets/images/bwInsustry.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                    padding:
                    EdgeInsets.only(top: 330.0, left: 20.0, right: 20.0),
                    child: Form(
                      key: formKey,
                      child: ListView(
                        padding: EdgeInsets.all(20),
                        children: [
                          buildRegFirstName(),
                          const SizedBox(height: 10),
                          buildRegLastName(),
                          const SizedBox(height: 10),
                          buildRegEmail(),
                          const SizedBox(height: 10),
                          buildRegPassword(),
                          const SizedBox(height: 10),
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
                                    if (formKey.currentState != null &&
                                        formKey.currentState.validate()) {

                                      _regesterUser();
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             LoginPage()));
                                    } else {
                                      print("Not Validate");
                                    }
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) => menuPage()));
                                  },
                                  child: Center(
                                    child: Text('Register',
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
                          )
                        ],
                      ),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 140.0, 0.0, 0.0),
                  child: Text(
                    'Hi',
                    style: TextStyle(
                        fontSize: 70.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors
                            .amber.shade600), //ffc107 which is kinda yellow
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(70, 120.0, 0.0, 0.0),
                    child: Text(
                      '!',
                      style: TextStyle(
                          fontSize: 100.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.amber),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(35.0, 760.0, 0.0, 0.0),
                  child: Text(
                      ''
                          ' Have an account?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.00,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(225.0, 760.0, 0.0, 0.0),
                    child: InkWell(
                        highlightColor: Colors.orange.withOpacity(0.5),
                        splashFactory: InkRipple.splashFactory,
                        splashColor: Colors.yellow.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(2),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage(title: '')));
                        },
                        child: Text('sign-in Here!',
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
  Widget buildRegFirstName() =>
      TextFormField(
        controller: _regFirstNameController,
        decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.account_box_rounded),
            labelText: 'First Name',
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 30),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(220, 255, 153, 0)))),
        textInputAction: TextInputAction.next,
        validator: (String value) {
          //put Validation over here..
          if (value == null || value
              .trim()
              .length == 0) {
            return "Field is required";
          }
          if (value.length <= 2) {
            return "Firstname should not be less then 2 characters";
          }
          return null;
        },
        onSaved: (value) {},
      );

  Widget buildRegLastName() =>
      TextFormField(
        controller: _regLastNameController,
        decoration: InputDecoration(
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.account_box_rounded),
            labelText: 'Last Name',
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 30),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(220, 255, 153, 0)))),
        textInputAction: TextInputAction.next,
        validator: (String value) {
          //put Validation over here..
          if (value == null || value
              .trim()
              .length == 0) {
            return "Field is required";
          }
          if (value.length <= 2) {
            return "Lastname should not be less then 2 characters";
          }
          return null;
        },
        onSaved: (value) {},
      );

  Widget buildRegEmail() =>
      TextFormField(
        controller:_regEmailController,
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
                borderSide: BorderSide(
                    color: Color.fromARGB(220, 255, 153, 0)))),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        validator: (String value) {
          //put Validation over here..
          if (value == null || value
              .trim()
              .length == 0) {
            return "Field is required";
          }
          if (!RegExp(r"^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$").hasMatch(value)) {
            return "Please Enter Valid email Address";
          }
          return null;
        },
        onSaved: (value) {},
      );

  Widget buildRegPassword() =>
      TextFormField(
        controller: _regPasswordController,

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
                borderSide: BorderSide(
                    color: Color.fromARGB(220, 255, 153, 0)))),
        textInputAction: TextInputAction.next,
        validator: (String value) {
          //put Validation over here..
          if (value == null || value
              .trim()
              .length == 0) {
            return "Field is required";
          }
          if (value.length <= 6) {
            return "Password should not be less then 6 characters";
          }
          return null;
        },
        onSaved: (value) {},
      );

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("ok"));

    //Set up the alertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Wrong Password"),
      content: Text("Email or Password is incorrect"),
      actions: [okButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
