import 'dart:convert';
import 'package:http/http.dart'
as http; // add the http plugin in pubspec.yaml file.

class Services {
  static const ROOT = 'http://192.168.1.70:8080/projectAPI/addStockData.php';
  static const _ADD_DATA_ACTION = 'ADD_DATA';

  // Method to add stock to the database...
  static Future<String> addStock(String _materialName,
      String _materialFrom,
      String _materialCost,
      String _vehicleType,
      String _vehicleRate,
      String _vatBill,
      String dateData) async {
    print(_materialName);
    print(_materialFrom);
    print(_materialCost);
    print(_vehicleType);
    print(_vehicleRate);
    print(_vatBill);
    print(dateData);
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_DATA_ACTION;
      map['material_name'] = _materialName;
      map['material_from'] = _materialFrom;
      map['materialCost'] = _materialCost;
      map['vehicleRate'] = _vehicleRate;
      map['vehicleType'] = _vehicleType;
      map['bill'] = _vatBill;
      map['dateData'] = dateData;
      print("this is test: $map");
      final response = await http.post(ROOT, body: map);
      print('addStock Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
