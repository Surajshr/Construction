import 'package:construction_aoo/view/Pages/fieldManager/model/stock_datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:construction_aoo/view/Pages/fieldManager/model/fetch_stock_data.dart';

class stockDataTable extends StatefulWidget {
  stockDataTable() : super();
  final String title = "Stock Data Table";

  @override
  _stockDataTableState createState() => _stockDataTableState();
}

class _stockDataTableState extends State<stockDataTable> {
  String _titleProgress;
  List<Datas> _datas;

  @override
  void initState() {
    super.initState();
    _getStocks();
  }

// Method to update title in the AppBar Title
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _getStocks() {
    _showProgress('Loading Stocks...');
    fetch_Services.getStocks().then((Stocks) {
      setState(() {
        _datas = Stocks;
      });
      _showProgress(widget.title); //Reset the title...
      print("length ${Stocks.length}");
    });
  }

  _deleteStocks(Datas datas) {
    _showProgress("Deleting Stock....");
    fetch_Services.deleteStocks(datas.id).then((result) {
      if ('success' == result) {
        _getStocks(); //refresh after delete
      }
    });
  }

  Widget dataBody() {
    final columns = [
      'ID',
      'DATE',
      'M_NAME',
      'M_FROM',
      'M_COST',
      'VEHICLE',
      'V_RATE',
      'VAT_BILL',
      'DELETE'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: getColumns(columns),
          rows: _datas
              .map(
                (stocks) => DataRow(cells: [
                  DataCell(
                    Text(stocks.id),
                  ),
                  DataCell(
                    Text(stocks.stockDate),
                  ),
                  DataCell(
                    Text(stocks.materialName),
                  ),
                  DataCell(
                    Text(stocks.materialFrom),
                  ),
                  DataCell(
                    Text(stocks.materialCost),
                  ),
                  DataCell(
                    Text(stocks.vehicleType),
                  ),
                  DataCell(
                    Text(stocks.vehicleRate),
                  ),
                  DataCell(
                    Text(stocks.vatBill),
                  ),
                  DataCell(IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteStocks(stocks);
                    },
                  )),
                ]),
              )
              .toList(),
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
        title: Text(_titleProgress),
      ),
      body: Container(child: dataBody()),
    );
  }
}
