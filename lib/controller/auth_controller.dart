import 'package:hilfedienst/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  
  //this is profile api controller
  static Future<http.Response> profileController()async{
    SharedPreferences prefe = await SharedPreferences.getInstance(); 
    var token = prefe.getString("token"); 
    var userId = prefe.getString("user_id");

    return await http.get(Uri.parse("${AppConfig.PROFILE}$userId"),
      headers: {
        "Authorization" : "Bearer $token"
      }
    );
  }

  static Future dashBoard()async{
    SharedPreferences prefe = await SharedPreferences.getInstance();
    var token = prefe.getString("token");

    return await http.get(Uri.parse(AppConfig.DASHBOARD),
        headers: {
          "Authorization" : "Bearer $token"
        }
    );
  }
  
}