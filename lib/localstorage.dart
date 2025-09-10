
import 'package:shared_preferences/shared_preferences.dart';


// ignore: camel_case_types
class localStorageState  {
 String taskKey="task";

 Future<void> saveData(List<String> value) async{
  final prefs= await SharedPreferences.getInstance();
  await prefs.setStringList(taskKey, value);
  
 }

 Future<void> updateData(List<String> value) async{
  final prefs= await SharedPreferences.getInstance();
  await prefs.setStringList(taskKey, value);
  
 }

Future<List<String>> loadData() async{
  final prefs= await SharedPreferences.getInstance();
 return prefs.getStringList(taskKey) ?? [];
 }
//  Future<void> deleteData() async{
//   final prefs= await SharedPreferences.getInstance();
//   await prefs.remove(taskKey);
//  }
}