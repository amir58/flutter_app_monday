// conditions, loops , Strings
void main() {
  // conditions => if , switch
  // if ( condition ) { true } else { false }

  bool working = true;

  if (working) {
    print('I wake up at 7 AM');
  } else {
    print('I Wake up at 10 AM');
  }

  // pending, onWay, completed, refused, returned

  String orderState = "onWay";

  if (orderState == "pending") {
    print('Case 1');
  } else if (orderState == "onWay") {
    print('Case 2');
  } else if (orderState == "completed") {
    print('Case 3');
  } else if (orderState == "refused") {
    print('Case 4');
  } else if (orderState == "returned") {
    print('Case 5');
  } else {
    print('Order state unknown');
  }

  // switch (variable) {
  //  cases
  // }

  switch (orderState) {
    case "pending":
      {
        print('Case One');
      }
      break;
    case "onWay":
      {
        print('Case Two');
      }
      break;
    case "completed":
      {
        print('Case Three');
      }
      break;
    case "returned":
      {
        print('Case Four');
      }
      break;
    case "refused":
      {
        print('Case Five');
      }
      break;
    default:
      {
        print('Order state unknown');
      }
  }

  // loops > for , while , do while

  int counter = 0; // 10

  while(counter < 10){
    print(counter);
    counter++;
  }

  print('- - - - - - - - - -');

  for(int x = 0; x < 5; x++){
    print(x);
  }

  print('- - - - - - - - - - - - -');

  int y = 0;
  do{
    print(y);
    y++;
  }
  while(y < 5);

  print('- - - - - - - - - - - -');

  // Strings => equal , isEmpty , isNotEmpty , startWith , replaceAll
  //            length , contains , split , concat , toLowerCase
  //            toUpperCase , trim

  String name = " Amir Mohammed";

  bool equal = (name == "amir");

  bool empty = name.isEmpty;

  bool notEmpty = name.isNotEmpty;

  int length = name.length;
  print(length);

  bool contain = name.contains(" ");
  print(contain);

  name = name + " Abdulaziz ";

  print(name);
  print(name.length);
  name = name.trim();
  print(name.length);

  print(name.toUpperCase());
  print(name.toLowerCase());

  // iPhone

  String mobileName = "iPhone 13";

  String key = "IPHONE";

  String mobileNameLower = mobileName.toLowerCase();
  print(mobileNameLower);

  String keyLower = key.toLowerCase();
  print(keyLower);

  bool isIPhoneAvailable = mobileNameLower.contains(keyLower);

  print(isIPhoneAvailable);

  String phone = "+20111-603-6522";

  if(phone.startsWith("+2")){
    phone = phone.replaceFirst("+2", "");
  }
  print(phone);

  phone = phone.replaceAll("-", "");

  print(phone);
}
