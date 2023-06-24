import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/WorldStateModel.dart';
import 'Utilities/app_url.dart';
class StateServices{
  Future<WorldStateModel> fetchWorldRecord () async{
    final response = await http.get(Uri.parse(AppUrls.worldUrl));
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    }else{
      throw Exception("Fuck You");
    }
  }


  Future<List<dynamic>> CountryRecordApi () async{

    final response = await http.get(Uri.parse(AppUrls.countryUrl));
    var data;
    if(response.statusCode==200){
      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception("Fuck You");
    }
  }
}