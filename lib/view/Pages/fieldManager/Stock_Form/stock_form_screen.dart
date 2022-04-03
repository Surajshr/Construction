import 'package:construction_aoo/view/Pages/fieldManager/model/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_picking.dart';
import 'material_Form_bottom_nav_bar.dart';

class MaterialForm extends StatefulWidget {
  const MaterialForm({Key key}) : super(key: key);

  final String title = " Stock Form";

  @override
  _MaterialFormState createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  DateTime date;
  int selectedRadio;
  bool _vatBil = true;
  int _vehicleRate;
  String vehicleChose = 'Truck';
  var listItem = ["Truck", "Mini Truck", "Tractor", "Others"];

  String getText() {
    if (date == null) {
      return 'MM/dd/yy';
    } else {
      return DateFormat('MM/dd/yyyy').format(date);
    }
  }
  GlobalKey<ScaffoldState> _scaffoldKey;
  // controller for the material Name TextField we are going to create.
  TextEditingController _materialNameController;

  // controller for the address of material TextField we are going to create.
  TextEditingController _materialFromController;

  // controller for the cost of material TextField we are going to create.
  TextEditingController _materialCostController;

  // controller for the vehicle rateTextField we are going to create.
  TextEditingController _vehicleRateController;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
      if (selectedRadio == 1) {
        _vatBil = true;
      } else {
        _vatBil = false;
      }
    });
  }
  String _titleProgress;

  @override
  void initState() {
    super.initState();
    _titleProgress = widget.title;
    _materialNameController = TextEditingController();
    _materialFromController = TextEditingController();
    _materialCostController = TextEditingController();
    _vehicleRateController = TextEditingController();
  }

  //Mwthod to update title in the appBar title

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _addStockData() {
    if (_materialNameController.text.isEmpty ||
        _materialFromController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    String chosedVechile = vehicleChose.toString();
    String vatBill = selectedRadio.toString();
    String DateData = date.toString().substring(0,11);
    _showProgress('Adding Data...');
    Services.addStock(
        _materialNameController.text,
        _materialFromController.text,
        _materialCostController.text,
        chosedVechile,
        _vehicleRateController.text,
        vatBill,
        DateData)
        .then((result) {
      if ('success' == result) {
        // _getEmployees(); // Refresh the List after adding each employee...
        print("Double success");
        //Will show some snack bar if data is inserted
        // _showSnackBar(context, "Success");
        _showProgress("Stock");
        _clearValues();
      }
    });
  }

  _clearValues() {
    _materialNameController.text = "";
    _materialFromController.text = "";
    _materialCostController.text = "";
    _vehicleRateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleProgress),
      ),
      bottomNavigationBar: MaterialBottomNavBar(),
      body: Container(
        margin: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _scaffoldKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMaterialName(),
                _buildMaterialFrom(),
                _setRadioButton(),
                _buildMaterialCost(),
                SizedBox(height: 10),
                labelText(message: "Vehicle Type "),
                _buildVehicleType(),
                _buildVehicleRate(),
                SizedBox(height: 10),
                labelText(message: "Pick Date"),
                SizedBox(height: 10),
                _buildDate(),
                ElevatedButton(
                  onPressed: () {
                    _addStockData();
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleRate() {
    return TextFormField(
      controller: _vehicleRateController,
      decoration: InputDecoration(labelText: 'Vehicle Cost (Rs.)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Value is required';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildMaterialCost() {
    return TextFormField(
      controller: _materialCostController,
      decoration: InputDecoration(labelText: 'Material Cost (Rs.)'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Value is required';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildMaterialFrom() {
    return TextFormField(
      controller: _materialFromController,
      decoration: InputDecoration(labelText: 'Material From'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildMaterialName() {
    return TextFormField(
      controller: _materialNameController,
      decoration: InputDecoration(labelText: 'Material Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
    );
  }

  Widget _setRadioButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("VAT Bill:",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(width: 12.0),
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: selectedRadio,
                activeColor: Colors.green,
                onChanged: (val) {
                  print("Radio $val");
                  setSelectedRadio(val);
                },
              ),
              Text(
                "Yes",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.0),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: selectedRadio,
                activeColor: Colors.green,
                onChanged: (val) {
                  print("Radio $val");
                  setSelectedRadio(val);
                },
              ),
              Text(
                "No",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildVehicleType() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          //borderRadius: BorderRadius.circular(15)
        ),
        child: DropdownButton(
          items: listItem.map((String valueItem) {
            // print("This is value item $valueItem");
            return DropdownMenuItem<String>(
                value: valueItem, child: Text(valueItem));
          }).toList(),
          hint: Text("Select Vehicle"),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 28,
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(color: Colors.black, fontSize: 17),
          value: vehicleChose,
          onChanged: (newValue) {
            setState(() {
              vehicleChose = newValue;
            });
          },
        ),
      ),
    );
  }

  Widget _buildDate() {
    Future pickDate(BuildContext context) async {
      final initialDate = DateTime.now();
      final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
      );
      if (newDate == null) return;
      setState(() {
        date = newDate;
      });
    }

    return ButtonHeaderidget(
      title: 'Date',
      text: getText(),
      onClicked: () => pickDate(context),
    );
  }
}

class labelText extends StatelessWidget {
  final String message;

  const labelText({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(message,
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0));
  }
}
