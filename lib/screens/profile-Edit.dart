import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  bool _isObscure = true; // Variable to track password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff004AAB)),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text(S.of(context).profile),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F2F3), // Gray background
                    borderRadius: BorderRadius.circular(10), // Soft edges
                  ),
                  padding: EdgeInsets.all(16), // Padding for the container
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).email,//'Email',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff004AAB),
                        ),
                      ),
                      SizedBox(height: 18),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        S.of(context).phoneNum,//'Phone Number',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff004AAB),
                        ),
                      ),
                      SizedBox(height: 18),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        S.of(context).password,//'Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff004AAB),
                        ),
                      ),
                      SizedBox(height: 18),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Toggle password visibility
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            child: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        obscureText: _isObscure, // Toggle based on password visibility
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Show pop-up notification for successful reset
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(S.of(context).infoUpdate//'Information Updated Successfully'
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(S.of(context).ok),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ), backgroundColor: Color(0xFF9199A1),
                      ),
                      child: Text(
                        S.of(context).save,//'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}