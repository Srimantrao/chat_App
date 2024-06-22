// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class SinupController with ChangeNotifier {
  bool _fullname = false;
  bool _phone = false;
  bool _email = false;
  bool _password = false;
  bool _country = false;
  bool _Address = false;
  bool _State = false;
  bool _city = false;
  bool _postal = false;
  bool _Date = false;

  bool _male = false;
  bool _female = false;
  bool _other = false;

  get male => _male;

  get female => _female;

  get other => _other;

  get fullname => _fullname;

  get phone => _phone;

  get email => _email;

  get password => _password;

  get country => _country;

  get Address => _Address;

  get State => _State;

  get city => _city;

  get postal => _postal;

  get Date => _Date;

  void Full_Name_Boder() {
    _fullname = true;
    _phone = false;
    _email = false;
    _password = false;
    _country = false;
    _Address = false;
    _State = false;
    _Date = false;
    _city = false;
    _postal = false;
    notifyListeners();
  }

  void PhoneNumber_Boder() {
    _fullname = false;
    _phone = true;
    _email = false;
    _password = false;
    _country = false;
    _Address = false;
    _State = false;
    _city = false;
    _Date = false;
    _postal = false;
    notifyListeners();
  }

  void EmailAddress_Boder() {
    _email = true;
    _phone = false;
    _password = false;
    _fullname = false;
    _country = false;
    _Address = false;
    _State = false;
    _city = false;
    _Date = false;
    _postal = false;
    notifyListeners();
  }

  void Password_Boder() {
    _email = false;
    _password = true;
    _phone = false;
    _fullname = false;
    _country = false;
    _Address = false;
    _State = false;
    _Date = false;
    _postal = false;
    _city = false;
    notifyListeners();
  }

  void Address_Boder() {
    _email = false;
    _password = false;
    _phone = false;
    _fullname = false;
    _country = false;
    _Address = true;
    _State = false;
    _Date = false;
    _postal = false;
    _city = false;
    notifyListeners();
  }

  void Country_Boder() {
    _email = false;
    _password = false;
    _phone = false;
    _fullname = false;
    _country = true;
    _State = false;
    _Date = false;
    _city = false;
    _postal = false;
    notifyListeners();
  }

  void State_Boder() {
    _email = false;
    _password = false;
    _phone = false;
    _fullname = false;
    _country = false;
    _State = true;
    _Date = false;
    _city = false;
    _postal = false;
    notifyListeners();
  }

  void City_Boder() {
    _email = false;
    _password = false;
    _phone = false;
    _fullname = false;
    _country = false;
    _State = false;
    _city = true;
    _postal = false;
    _Date = false;
    notifyListeners();
  }

  void Postal_code() {
    _email = false;
    _password = false;
    _phone = false;
    _fullname = false;
    _country = false;
    _State = false;
    _city = false;
    _postal = true;
    _Date = false;
    notifyListeners();
  }

  void Date_Boder() {
    _email = false;
    _password = false;
    _phone = false;
    _fullname = false;
    _country = false;
    _State = false;
    _Date = true;
    _city = false;
    _postal = false;
    notifyListeners();
  }

  //Gnter Fuction
  void male_fuc(Gender) {
    _male = Gender!;
    notifyListeners();
  }

  void female_fuc(Gender) {
    _female = Gender!;
    notifyListeners();
  }

  void others(Gender) {
    _other = Gender!;
    notifyListeners();
  }
}
