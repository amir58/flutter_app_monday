class Person{

  String _id ;
  String _name;
  String _address;
  String _phone;

  Person(this._id, this._name, this._address, this._phone);

  void printData(){
    print('- - - - - - - - - - -');
    print('ID : $_id');
    print('Name : $_name');
    print('Address : $_address');
    print('Phone : $_phone');
  }

  String get name => _name;
}