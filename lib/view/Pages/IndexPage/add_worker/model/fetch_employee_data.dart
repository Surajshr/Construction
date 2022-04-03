import 'dart:convert';
import 'package:http/http.dart' as http;

import '../employee_data.dart';


class fetch_employee{
  static const ROOT = 'http://192.168.1.70:8080/projectAPI/fetchEmployee.php';
  static const _GET_ALL_ACTION = 'GET_ALL_EMP';
  static const _DELETE_STOCK_ACTION = 'DELETE_EMP_DATA';


  //fetch data from database
  static Future<List<Info>> getEmployee() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getEmployees Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Info> list = parseResponse(response.body);
        return list;
      } else {
        return List<Info>();
      }
    } catch (e) {
      return List<Info>(); // return an empty list on exception/error
    }
  }
  static List<Info> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Info>((json) => Info.fromJson(json)).toList();
  }


  // used to delete a data
  static Future<String > deleteStocks (String ID) async{
    try{
      var map = Map<String ,dynamic>();
      map['action'] = _DELETE_STOCK_ACTION;
      map['id'] =ID;
      final response = await http.post(ROOT, body: map);
      print('deleteStock response: ${response.body}');

      if(200 == response.statusCode){
        return response.body;
      }
      else{
        return "error";
      }
    }catch(e)
    {
      return "error";
    }
  }

}

