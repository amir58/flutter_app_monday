// Class , Object
import 'package:flutter_app_monday/done/user.dart';

void main(){
  // ClassName objectName = ClassName();

  User.gender = "female";

  User user1 = new User("Amir", "01030936083", "Cairo");
  user1.phone = "01116036522";

  print(user1.phone);

  // amir.printUserData();

  User khaled = User("Khaled", "012", "Giza");
  // khaled.printUserData();

  User youssef = User.name("Youssef");

  String name1 = "youssef";
  String phone1 = "011";
  String address1 = "Alex";
  print(name1);
  print(phone1);
  print(address1);

}

test(String name){

}





