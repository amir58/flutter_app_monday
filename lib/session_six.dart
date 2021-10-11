import 'package:flutter_app_monday/inheritance/person.dart';
import 'package:flutter_app_monday/inheritance/student.dart';

void main(){

  Person personOne = Person("1", "Amir", "Cairo", "011");
  personOne.printData();

  Person personTwo = Person("2", "Ahmed", "Cairo", "012");
  personTwo.printData();

  Student studentOne = Student("3", "Mohamed", "Alex", "015", "20181425");
  studentOne.printData();

}