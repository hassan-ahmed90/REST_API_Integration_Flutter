import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/WorldStateModel.dart';
import 'package:rest_api/Services/Utilities/app_url.dart';

class StateServices {
  Future<WorldStateModel> fetchWorldStateRecord() async{

    final response = await http.get(Uri.parse(AppUrls.worldUrl));
    if(response.body==200){
     var data = jsonDecode(response.body);
     return WorldStateModel.fromJson(data);
    }else{

      throw Exception("Error");

    }

  }
}