import 'package:flutter/material.dart';
import '../services/employee_service.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final EmployeeService _employeeService= EmployeeService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _positionController,
              decoration: const InputDecoration(labelText: 'Position', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              final name = _nameController.text.trim();
              final position = _positionController.text.trim();

              if(name.isNotEmpty && position.isNotEmpty){
                _employeeService.addEmployee(name, position);
                Navigator.pop(context);
              }
            }, 
            child: const SizedBox(
              width: double.infinity,
              child: Center(child: Text('Add Employee'),),
            ),)
          ],
        ),)
    );
  }
}