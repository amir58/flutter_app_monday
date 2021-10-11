import 'package:flutter_app_monday/inheritance/person.dart';

class Student extends Person {

  String studentId;

  Student(String id, String name, String address, String phone, this.studentId)
      : super(id, name, address, phone);

  // generate => override methods
  @override
  void printData() {
    super.printData();
    print('StudentID : $studentId');
  }

  void printSpecificData(){
    print('Name : $name');
    print('StudentID : $studentId');
  }
}