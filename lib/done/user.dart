class User{

  String _name ;
  String _phone;
  String _address;
  static String gender = "male";

  User(this._name, this._phone, this._address){
    printUserData();
  }

  // User(String name, String phone, String address){
  //   this.name = name;
  //   this.phone = phone;
  //   this.address = address;
  //   printUserData();
  // }

  User.name(String name){
    this._name = name;
  }

  void printUserData(){
    print('Name : $_name');
    print('Phone : $_phone');
    print('Address : $_address');
    print('Gender $gender');
  }

  String get phone => _phone;

  String get address => _address;

  String get name => _name;

  set address(String address) {
    _address = address;
  }

  set phone(String phone) {
    if(phone.length == 11){
      _phone = phone;
    }
    else{
      print('ERROR => Phone mut be 11 characters');
    }
  }
}