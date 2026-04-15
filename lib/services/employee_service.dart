import 'package:firebase_database/firebase_database.dart';

class EmployeeService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('list_employee');
  Stream<Map<String, dynamic>> getListEmployee(){
    return _database.onValue.map((event){
      final Map<String, dynamic>items = {};
      DataSnapshot snapshot = event.snapshot;
      if(snapshot.value !=null){
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value){
          items[key] = value;
        });
      }
      return items;
    });
  }
  void addEmployee(String name, String position){
    _database.push().set({
      'name': name,
      'position':position
    });
  }
    Future<void> removeEmployee(String key)async{
      await _database.child(key).remove();
    }
  }
