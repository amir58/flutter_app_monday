import 'package:flutter/cupertino.dart';

main() {
  // Test test = new Test();
  MyMath math = MyMath();

  math.sum();
  math.div();
  math.multi(10, 5);

  text("Amir", "Mohamed");
  myText(firstName: "Amir");
  sum(numberOne: 10, numberTwo: 20);

  ourText("HelloWorld!", fontSize: 22, color: "red");
}

void text(String firstName, String lastName) {}

void myText({@required String firstName, String lastName = ''}) {}

void sum({int numberOne = 0, int numberTwo = 0}){
  print(numberOne + numberTwo);
}

void ourText(String text, {int fontSize, String color}){
  print(text);
}

// Abstract & interfaces

abstract class Test {
  void sum(); // abstract function

  void div() {
    print('div');
  }
}

class MyMath extends Test implements ITest, ITest2 {
  @override
  void sum() {
    print(5 + 9);
  }

  @override
  void sub() {
    print(10 - 5);
  }

  @override
  void multi(int numberOne, int numberTwo) {
    print(numberOne * numberTwo);
  }

  @override
  void test() {}
}

class ITest {
  void sub() {}

  void multi(int numberOne, int numberTwo) {}
}

class ITest2 {
  void test() {}
}
