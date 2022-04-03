
import 'package:http/http.dart' as http;

class userServices{
  static const ROOT = 'http://a2b1-27-34-68-198.ngrok.io/flutter/projectAPI/newUser.php';
  static const _ADD_USER_ACTION ='ADD_USER';

  // Method to add user to database
  static Future<String> addUser(
      String _email,
      String _firstName,
      String _lastName,
      String _password
      ) async{
    try{
      var map = Map<String, dynamic> ();
      map ['action'] = _ADD_USER_ACTION;
      map ['email'] = _email;
      map ['firstName'] = _firstName;
      map ['lastName'] = _lastName;
      map ['password'] = _password;

      final response = await http.post(ROOT,body: map);
      print('user added: ${response.body}');
      if(200== response.statusCode){
        return response.body;
      }
      else{
        return "error";
      }

    }catch(e){
      return "error";
    }
  }


}