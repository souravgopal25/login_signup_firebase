class User{
  String _uid,_name,_email,_phone;


  User(this._name, this._email, this._phone);

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  get name => _name;

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  set name(value) {
    _name = value;
  }
}