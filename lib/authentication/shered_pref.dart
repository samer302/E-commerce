import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
   read(String key )async{
    final prefs= await SharedPreferences.getInstance();
    if(prefs.containsKey(key)) return prefs.getString(key);
    return null;
   }
   save(String key,value)async{
     final prefs=await SharedPreferences.getInstance();
    prefs.setString(key, value);
   }
   remove(String key)async{
     final prefs= await SharedPreferences.getInstance();
     if(prefs.containsKey(key)) return prefs.remove(key);
   }

}