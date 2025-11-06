import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Sharepref {

  Future<void> save(String key, dynamic value)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  Future<dynamic> read(String key)async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString(key)!=null){
      return jsonDecode(prefs.getString(key)!);
    }
    return null;
  }

  Future<bool> remove(String key) async{
    final prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }

  Future<bool> contains(String key) async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

}