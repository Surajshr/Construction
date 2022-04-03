import 'dart:convert';
import 'package:construction_aoo/view/Pages/IndexPage/add_worker/worker_bottom_nav_bar.dart';
import 'package:http/http.dart' as http;


import 'package:construction_aoo/view/Pages/fieldManager/Stock_Form/date_picking.dart';
import 'package:construction_aoo/view/Pages/fieldManager/Stock_Form/material_Form_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addWorkerPage extends StatelessWidget {
  const addWorkerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: EmployeeBottomNavBar(),
      body: AddWorker(),
    );
  }
}

class AddWorker extends StatefulWidget {
  const AddWorker({Key key}) : super(key: key);

  @override
  _AddWorkerState createState() => _AddWorkerState();
}

class _AddWorkerState extends State<AddWorker> {
  final formKey = GlobalKey<FormState>();
  final message = "Worker has been added";

  int selectedValue = 0; //used to select the gender value
  final gender = ['None', 'Male', 'Female', 'Other'];
  var _currentItemSelected = "None";
  DateTime date;
  String getText() {
    if (date == null) {
      return 'MM/dd/yy';
    } else {
      return DateFormat('MM/dd/yyyy').format(date);
    }
  }
//used to select the gender item
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var first_name="";
  var middle_name="";
  var lastname_name="";
  var Positon_Title="";
  var street="";
  var address="";
  var city="";
  var state="";
  var email="";
  var Phone_number="";
  var Emergency_contact_name="";
  var Emergency_contact_number="";
  var status="";
  TextEditingController _first_name = TextEditingController();
  TextEditingController _lastname_name = TextEditingController();
  TextEditingController _middle_name = TextEditingController();
  TextEditingController _street = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _Emergency_contact_number = TextEditingController();
  TextEditingController _Emergency_contact_name = TextEditingController();
  TextEditingController _Phone_number = TextEditingController();
  TextEditingController _status = TextEditingController();
  TextEditingController _Positon_Title = TextEditingController();



  _clearValues() {
    _first_name.text="";
    _lastname_name.text="";
    _middle_name.text="";
    _street.text="";
    _address.text="";
    _city.text="";
    _state.text="";
    _email.text="";
    _Emergency_contact_number.text="";
    _Emergency_contact_name.text="";
    _Phone_number.text="";
    _Positon_Title.text="";
  }


  // TextEditingController _first_name;
  // TextEditingController _lastname_name;
  // TextEditingController _middle_name ;
  // TextEditingController _street ;
  // TextEditingController _address ;
  // TextEditingController _city ;
  // TextEditingController _state ;
  // TextEditingController _email;
  // TextEditingController _Emergency_contact_number ;
  // TextEditingController _Emergency_contact_name ;
  // TextEditingController _Phone_number;
  // TextEditingController _Positon_Title ;

// //for sendiing value in the database using API
  Future addNewEmployee() async {
    var APIurl = "http://a2b1-27-34-68-198.ngrok.io/flutter/projectAPI/addEmployee.php";

    Map mapedata = {
      'first_name': _first_name.text,
      'middle_name': _middle_name.text,
      'lastname_name': _lastname_name.text,
      'street': _street.text,
      'address': _address.text,
      'city': _city.text,
      'state': _state.text,
      'email': _email.text,
      'Phone_number': _Phone_number.text,
      'Positon_Title':_Positon_Title.text,
      'Emergency_contact_name': _Emergency_contact_name.text,
      'Emergency_contact_number': _Emergency_contact_number.text,
      // 'status': _status.text
    };
    print("JSON Data $mapedata");
    http.Response response = await http.post(APIurl, body: mapedata);
    var data = jsonDecode(response.body);
    print("DATA: $data");
  }

  // @override
//   void initState() {
//     super.initState();
//     _first_name = TextEditingController();
//     _lastname_name = TextEditingController();
//       _middle_name = TextEditingController();
//       _street = TextEditingController();
//       _address = TextEditingController();
//      _state = TextEditingController();
//      _city = TextEditingController();
//      _Phone_number = TextEditingController();
//       _email = TextEditingController();
//      _Emergency_contact_number = TextEditingController();
//       _Emergency_contact_name = TextEditingController();
//           _Positon_Title = TextEditingController();
//   }
// String _titleProgress;
//
//   _showProgress(String message) {
//     setState(() {
//       _titleProgress = message;
//     });
//   }
//
//   _addEmployeeData(){
//     if(_Phone_number.text.isEmpty||_first_name.text.isEmpty||_lastname_name.text.isEmpty||
//         _middle_name.text.isEmpty||_city.text.isEmpty||_state.text.isEmpty||
//         _street.text.isEmpty||_address.text.isEmpty||_email.text.isEmpty||
//         _Phone_number.text.isEmpty||_Emergency_contact_number.text.isEmpty||
//      _Emergency_contact_name.text.isEmpty||_Phone_number.text.isEmpty||
//         _Positon_Title.text.isEmpty )
//       {
//         print('Empty Fields');
//         return;
//     }
//     String DateData =date.toString().substring(0,11);
//     String genderData =gender.toString();
//     addNewEmployee.addEmployee(_first_name.text, _lastname_name.text, _middle_name.text,
//         _street.text, _address.text, _city.text, _state.text, _email.text,
//         _Emergency_contact_name.text, _Emergency_contact_number.text,
//         _Phone_number.text, _Positon_Title.text, genderData, DateData).then((result) {
//     if ('success' == result) {
//     // _getEmployees(); // Refresh the List after adding each employee...
//     print("Double success");
//     //Will show some snack bar if data is inserted
//     // _showSnackBar(context, "Success");
//     _showProgress("Add New Employee");
//     _clearValues();      }
//     });  }
//


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add worker"),
        ),
        body: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                "Employee Information",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              buildFirstName(),
              SizedBox(
                height: 16,
              ),
              buildMiddleName(),
              SizedBox(
                height: 16,
              ),
              buildLastName(),
              SizedBox(
                height: 25,
              ),
              Text("Gender",
                  style:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              buildGenderSelection(),
              SizedBox(
                height: 14,
              ),
              // _buildDate(),
              // SizedBox(
              //   height: 16,
              // ),
              buildAddress(),
              SizedBox(
                height: 16,
              ),
              buildCity(),
              SizedBox(
                height: 16,
              ),
              buildState(),
              SizedBox(
                height: 16,
              ),
              buildPhoneNumber(),
              SizedBox(
                height: 16,
              ),
              buildEmail(),
              SizedBox(
                height: 16,
              ),
              buildPositionTitle(),
              SizedBox(
                height: 16,
              ),
              buildEmergencyContactName(),
              SizedBox(
                height: 16,
              ),
              buildEmergencyContactNo(),
              SizedBox(
                height: 16,
              ),
              buildSubmit()
            ],
          ),
        ));
  }


  Widget buildFirstName() => TextFormField(
    controller: _first_name,
    textInputAction: TextInputAction.next,
    decoration: const InputDecoration(
      labelText: "First Name",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     firstName = value! as TextEditingController;
    //   });
    // }
  );

  Widget buildMiddleName() => TextFormField(
    controller: _middle_name,
    textInputAction: TextInputAction.next,
    decoration: const InputDecoration(
      labelText: "Middle Name",
      hintText: "Optional",
      border: OutlineInputBorder(),
    ),
    // onSaved: (value) {
    //   setState(() {
    //     middleName = value! as TextEditingController;
    //   });
    // }
  );

  Widget buildLastName() => TextFormField(
    controller: _lastname_name,
    textInputAction: TextInputAction.next,
    decoration: const InputDecoration(
      labelText: "Last Name",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     lastName = value! as TextEditingController;
    //   });
    // }
  );

  Widget buildAddress() => TextFormField(
    controller: _address,
    textInputAction: TextInputAction.next,


    decoration: const InputDecoration(
      labelText: "Address",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     address = value! as TextEditingController;
    //   });
    // }
  );

  Widget buildStreetAddress() => TextFormField(
    controller: _street,
    textInputAction: TextInputAction.next,
    decoration: const InputDecoration(
      labelText: "Street Address",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     street = value! as TextEditingController;
    //   });
    // }
  );

  Widget buildCity() => TextFormField(
    controller: _city,
    textInputAction: TextInputAction.next,

    decoration: const InputDecoration(
      labelText: "City",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    // buttonW    city= value! as TextEditingController;
    //   });
    // }
  );

  Widget buildState() => TextFormField(
    controller: _state,
    textInputAction: TextInputAction.next,

    decoration: const InputDecoration(
      labelText: "State",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     state= value! as TextEditingController;
    //   });
    // }
  );

  Widget buildPhoneNumber() => TextFormField(
    keyboardType: TextInputType.number,
    controller: _Phone_number,
    textInputAction: TextInputAction.next,

    decoration: const InputDecoration(
      labelText: "Phone Number",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     phoneNumber = value! as TextEditingController;
    //   });
    // }
  );

  Widget buildEmail() => TextFormField(
    controller: _email,
    textInputAction: TextInputAction.next,

    decoration: const InputDecoration(
      labelText: "Email",
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
      final regExp = RegExp(pattern);

      if (value.isEmpty) {
        return 'Enter an email';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter a valid email';
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.emailAddress,
    onSaved: (value) =>
        setState(() => _email = value as TextEditingController),
  );

  Widget buildEmergencyContactName() => TextFormField(
    controller: _Emergency_contact_name,
    textInputAction: TextInputAction.next,

    decoration: const InputDecoration(
      labelText: "Emergency Contact Name",
      border: OutlineInputBorder(),
    ),
  );

  Widget buildEmergencyContactNo() => TextFormField(
    keyboardType: TextInputType.number,
    controller: _Emergency_contact_number,
    textInputAction: TextInputAction.next,

    decoration: const InputDecoration(
      labelText: "Emergency Contact Number",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     emergencyContactName= value! as TextEditingController;
    //   });
    //}
  );

  Widget buildPositionTitle() => TextFormField(
    controller: _Positon_Title,
    textInputAction: TextInputAction.next,

    decoration: const InputDecoration(
      labelText: "Position Title",
      border: OutlineInputBorder(),
    ),
    validator: (value) => value.isEmpty ? 'this field is required' : null,
    // onSaved: (value) {
    //   setState(() {
    //     emergencyContactNumber = value! as TextEditingController;
    //   });
    // }
  );


  Widget buildGenderSelection() => Container(
    margin: EdgeInsetsDirectional.only(start: 5, end: 10),
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    decoration: BoxDecoration(
      border: Border.all(width: .5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        iconSize: 40.0,
        elevation: 3,
        isExpanded: true,
        items: gender.map((String dropdownStringItem) {
          return DropdownMenuItem<String>(
            value: dropdownStringItem,
            child: Text(dropdownStringItem),
          );
        }).toList(),
        onChanged: (String newValueSelected) {
          setState(() {
            this._currentItemSelected = newValueSelected;
          });
        },
        value: _currentItemSelected,
      ),
    ),
  );

  Widget buildSubmit() => Container(
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
          highlightColor: Colors.orange.withOpacity(0.5),
          splashFactory: InkRipple.splashFactory,
          splashColor: Colors.yellow.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          onTap: ()
          {

            // used to validate a form when we click a login button
            if (formkey.currentState.validate()) {
              addNewEmployee();
              _clearValues();
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              print("Record Has been Saved");
            } else {
              print("Not Validate");
            }
            //
            // final isValid = formKey.currentState.validate();
            // // FocusScope.of(context).unfocus();
            //
            // if (isValid) {
            //   formKey.currentState.save();
            //
            //   final message = "record Has been Saved";
            //   // 'Username: $username\nPassword: $password\nEmail: $email';
            //   final snackBar = SnackBar(
            //     content: Text(
            //       message,
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     backgroundColor: Colors.green,
            //   );
            //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // }
          },
          child: Center(
            child: Text('Add Worker',
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

  Widget _buildDate() {
    Future pickDate(BuildContext context) async {
      final initialDate = DateTime.now();
      final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime(DateTime.now().year + 20),
      );
      if (newDate == null) return;
      setState(() {
        date = newDate;
      });
    }

    return ButtonHeaderWidget(
      title: 'Date of Birth',
      text: getText(),
      onClicked: () => pickDate(context),
    );
  }
}


class ButtonHeaderWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderWidget({
    Key key,
    @required this.title,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
    title: title,
    child: ButtonWidget(
      text: text,
      onClicked: onClicked,
    ),
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
  Widget build(BuildContext context) => Row(

    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      Expanded(
        flex: 4,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // minimumSize: Size.fromHeight(40),

            // primary: Colors.white,
          ),

          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          onPressed: onClicked,
        ),
      ),
      Icon(Icons.today,size: 40.0,
        color: Colors.amber,),

    ],
  );
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const HeaderWidget({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          // color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      child,
    ],
  );
}