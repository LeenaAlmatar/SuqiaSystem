import 'package:flutter/material.dart';
import 'package:suqia/screens/Log-in.dart';
import 'package:suqia/screens/Employee.dart';
import '../generated/l10n.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Employee _employee = Employee();
  String firstName = ''; // Define variable to store first name input
  String lastName = ''; // Define variable to store last name input
  String email = ''; // Define variable to store email input
  String password = ''; // Define variable to store password input
  String confirmPassword =
      ''; // Define variable to store confirm password input
  bool _obscurePassword = true; // Variable to toggle password visibility
  bool _obscureConfirmPassword =
  true; // Variable to toggle confirm password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff004AAB)),
          onPressed: () {},
        ),
        title: Text(S.of(context).signUpTitle),
        centerTitle: true,
        backgroundColor: Color(0xff004AAB),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Colors.white,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/Suqia.jpg',
                    width: 350,
                    height: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).firstName,
                      //'First Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: S
                            .of(context)
                            .firstNameMessage, //'Enter your first name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return S
                              .of(context)
                              .firstNameEmpty; //'Please enter your first name';
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      S.of(context).lastName,
                      //'Last Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: S
                            .of(context)
                            .lastNameMessage, //'Enter your last name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return S
                              .of(context)
                              .lastNameEmpty; //'Please enter your last name';
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      S.of(context).email,
                      //'Email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText:
                        S.of(context).emailMessage, //'Enter your email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return S
                              .of(context)
                              .emailEmpty; //'Please enter an email';
                        }
                        if (!(value?.endsWith('@suqia.com') ?? false)) {
                          return S
                              .of(context)
                              .emailErrorMes; //'Email must end with @suqia.com';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      S.of(context).password,
                      //'Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText:
                        S.of(context).passMessage, //'Enter your password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return S
                              .of(context)
                              .passEmpty; //'Please enter a password';
                        } else if (value!.length < 6) {
                          return S
                              .of(context)
                              .passShort; //'Password must be longer than 6 characters';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      S.of(context).passConf,
                      //'Confirm Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004AAB),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: S
                            .of(context)
                            .passConfHint, //'Confirm your password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6C6C6C)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 12.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                              !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureConfirmPassword,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return S
                              .of(context)
                              .passEmpty; //'Please enter a password';
                        } else if (value != password) {
                          return S
                              .of(context)
                              .passNotMatch; //'Passwords do not match';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          confirmPassword = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 36.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!lastName.isEmpty &&
                                !firstName.isEmpty &&
                                email.endsWith('@suqia.com') &&
                                confirmPassword == password &&
                                password.length > 6 &&
                                password.contains(RegExp(r'[A-Z]')) &&
                                password.contains(RegExp(r'[a-z]')) &&
                                password.contains(RegExp(r'[0-9]')) &&
                                password.contains(
                                    RegExp(r'[!@#%^&*(),.?":{}|<>]')) &&
                                _employee.signUp(
                                    firstName, lastName, email, password)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            } else {
                              String errorMessage = '';
                              if (!email.endsWith('@suqia.com')) {
                                errorMessage = S
                                    .of(context)
                                    .emailErrorMes; //'Email must end with @suqia.com';
                              } else if (confirmPassword != password) {
                                errorMessage = S
                                    .of(context)
                                    .passNotMatch; //'Passwords do not match';
                              }
                              if (password?.isEmpty ?? true) {
                                errorMessage = S
                                    .of(context)
                                    .passEmpty; //'Please enter a password';
                              }
                              if (firstName?.isEmpty ?? true) {
                                errorMessage = S
                                    .of(context)
                                    .firstNameEmpty; //'Please enter your first name';
                              }
                              if (lastName?.isEmpty ?? true) {
                                errorMessage = S
                                    .of(context)
                                    .lastNameEmpty; //'Please enter your last name';
                              } else if (password!.length < 6) {
                                errorMessage = S
                                    .of(context)
                                    .passShort; //'Password must be longer than 6 characters';
                              }
                              if (!password.contains(RegExp(r'[A-Z]'))) {
                                errorMessage = S
                                    .of(context)
                                    .passUpp; //'Password must contain at least one uppercase letter';
                              }
                              if (!password.contains(RegExp(r'[a-z]'))) {
                                errorMessage = S
                                    .of(context)
                                    .passLow; //'Password must contain at least one lowercase letter';
                              }
                              if (!password.contains(RegExp(r'[0-9]'))) {
                                errorMessage = S
                                    .of(context)
                                    .passDig; //'Password must contain at least one digit';
                              }
                              if (!password
                                  .contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                                errorMessage = S
                                    .of(context)
                                    .passChar; //'Password must contain at least one special character';
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(errorMessage),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0xff004AAB),
                          ),
                          child: Text(
                            S.of(context).signUpButton,
                            //'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).haveAcc,
                          //'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            S.of(context).loginPage,
                            //'Login',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff004AAB),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}