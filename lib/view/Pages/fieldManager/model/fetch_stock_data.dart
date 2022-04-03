import 'dart:convert';
import 'package:construction_aoo/view/Pages/fieldManager/model/stock_datas.dart';// add the http plugin in pubspec.yaml file.
import 'package:http/http.dart' as http;



class fetch_Services{
  static const ROOT = 'http://192.168.1.70:8080/projectAPI/fetchStockData.php';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _DELETE_STOCK_ACTION = 'DELETE_DATA';

  //fetch data from database
  static Future<List<Datas>> getStocks() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getEmployees Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Datas> list = parseResponse(response.body);
        return list;
      } else {
        return List<Datas>();
      }
    } catch (e) {
      return List<Datas>(); // return an empty list on exception/error
    }
  }


  static List<Datas> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Datas>((json) => Datas.fromJson(json)).toList();
  }

  static Future<String > deleteStocks (String mID) async{
    try{
      var map = Map<String ,dynamic>();
      map['action'] = _DELETE_STOCK_ACTION;
      map['m_id'] =mID;
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