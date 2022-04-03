import 'package:construction_aoo/view/Pages/IndexPage/add_worker/employee_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:construction_aoo/view/Pages/IndexPage/add_worker/model/fetch_employee_data.dart';

class EmployeeData extends StatefulWidget {
  const EmployeeData({Key key}) : super(key: key);
  final String title = "Employee Data Table";

  @override
  _EmployeeDataState createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  String _progressTitle;
  List<Info> _Information;

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  _showProgress(String message) {
    setState(() {
      _progressTitle = message;
    });
  }

  _getInfo() {
    _showProgress('Loading Stocks...');
    fetch_employee.getEmployee().then((infoData) {
      setState(() {
        _Information = infoData.cast<Info>();
      });
      _showProgress(widget.title); //Reset the title...
      print("length ${infoData.length}");
    });
  }

  _deleteStocks(Info info) {
    _showProgress("Deleting Stock....");
    fetch_employee.deleteStocks(info.ID).then((result) {
      if ('success' == result) {
        _getInfo(); //refresh after delete
      }
    });
  }

  Widget Empdata() {
    final columns = [
      'ID',
      'firstName',
      'LastName',
      'Street',
      'Address',
      'City',
      'State',
      'Email',
      'PositionTitle',
      'E_Name',
      'E_number',
      'Contact',
      'Delete'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: getColumns(columns),
          rows: _Information.map(
            (emp) => DataRow(cells: [
              DataCell(
                Text(emp.ID),
              ),
              DataCell(
                Text(emp.firstName),
              ),
              DataCell(
                Text(emp.LastName),
              ),
              DataCell(
                Text(emp.Street),
              ),
              DataCell(
                Text(emp.Address),
              ),
              DataCell(
                Text(emp.City),
              ),
              DataCell(
                Text(emp.State),
              ),
              DataCell(
                Text(emp.Email),
              ),
              DataCell(
                Text(emp.PositionTitle),
              ),
              DataCell(
                Text(emp.E_Name),
              ),
              DataCell(
                Text(emp.E_number),
              ),
              DataCell(
                Text(emp.Contact),
              ),
              DataCell(IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteStocks(emp);
                },
              )),
            ]),
          ).toList(),
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_progressTitle),
      ),
      body: Container(child: Empdata()),
    );
  }
}
