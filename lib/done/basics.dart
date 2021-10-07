import 'dart:io';

void main() {
  // Session 2

  print("Enter number one : ");

  // alt + enter
  String input = stdin.readLineSync();

  int numberOne = int.tryParse(input) ?? 1;

  print("Enter number two : ");

  String input2 = stdin.readLineSync();

  int numberTwo = int.tryParse(input2) ?? 1;

  print("Result + : ${numberOne + numberTwo}");
  print("Result - : ${numberOne - numberTwo}");
  print("Result * : ${numberOne * numberTwo}");
  print("Result / : ${numberOne / numberTwo}");
  print("Result / : ${numberOne % numberTwo}");

  print("- - - - - - - - - - - -");
  // increment ++
  // decrement --

  int number = 10;
  print(number);

  number++;
  print(number);

  number--;
  print(number);

  print("- - - - - - - - - - - -");
  // < , > , <= , >= , == , !=

  print(10 < 20);
  print(20 > 30);
  print(20 <= 25);
  print(30 >= 30);
  print(5 == 5);
  print(6 == 7);
  print(5 != 5);
  print(6 != 7);

  print("- - - - - - - - - - - - -");
  // is , is!
  String name = "amir";

  print(name is String);
  print(name is int);
  print(name is! String);

  print("- - - - - - - - - - - - - -");

  // += , -= , *= , /= , %= , ??=

  int myNumber = 10;

  myNumber = myNumber + 5;
  print(myNumber);

  myNumber += 5;
  print(myNumber);

  myNumber *= 5 ;
  print(myNumber);

  String myName;

  print(myName);

  myName ??= "Ahmed";

  print(myName);

  myName ??= "Mohammed";

  print(myName);

  print("- - - - - - - - - - - - - - -");
  // && , || , ! , ? : , ??

  print(!true);

  print(!false);

  bool r = !(5 > 10);
  print(r);

  print(5 > 10 && 7 > 6 && 1 > 2);
  print(5 > 10 || 7 > 6 || 1 > 2);

  int x = 20;
  int y = 11;

  String z = x > y ? "X > Y" : "X < Y";

  print(z);

}
