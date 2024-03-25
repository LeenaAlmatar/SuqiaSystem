class Employee {
  String _idEmployee = '';
  String _identity = '';
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get identity => _identity;

  set identity(String value) {
    _identity = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get idEmployee => _idEmployee;

  set idEmployee(String value) {
    _idEmployee = value;
  }

  bool signUp(String firstName, String lastName, String email, String password) {
    // Validate input fields
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      return false;
    }

    // Set values using setters
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;

    return true;
  }

  bool logIn(String email, String password) {
    // Check if email and password match the stored values
    if (email == _email && password == _password) {
      print('Login successful');
      return true;
    } else {
      print('Invalid email or password');
      return false;
    }
  }

  void updateProfile(String password, String phoneNumber) {
    _password = password;
    _phoneNumber = phoneNumber;
  }

  void resetPassword(String password, String email) {
    _password = password;
  }
}
