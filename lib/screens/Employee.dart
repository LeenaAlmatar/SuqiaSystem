import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  final String? id;
  late String firstName;
  late String lastName;
  late String email;
  late String password;

  Employee({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJSON() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Password": password,
    };
  }

  factory Employee.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Employee(
      id: document.id,
      email: data["Email"],
      firstName: data["FirstName"],
      lastName: data["LastName"],
      password: data["Password"],
    );
  }

  // Setter methods
  void setFirstName(String value) {
    firstName = value;
  }

  void setLastName(String value) {
    lastName = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }
  bool signUp(String firstName, String lastName, String email, String password) {
    // Validate input fields
    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || password.isEmpty) {
      return false;
    }

    // Set values using setters
    firstName = firstName;
    lastName = lastName;
    email = email;
    password = password;

    return true;
  }
}
