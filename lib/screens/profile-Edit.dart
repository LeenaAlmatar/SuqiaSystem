import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/Employee.dart'; // Import the Employee class
import '../generated/l10n.dart';
import 'package:first_app/screens/EmailResetPassword.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late bool _isObscure=true;
  late User? currentUser= FirebaseAuth.instance.currentUser;
  late String FirstName = '';
  late String LastName = '';
  late String Email = '';
  late String Password = '';
  late String initialFirstName = ''; // Store initial values
  late String initialLastName = '';
  late String initialEmail = '';
  late String initialPassword = '';

Future<void> edit(String field)async{
  String newValue="";
  await showDialog(context: context,
      builder: (context)=>AlertDialog(
        title:Text(S.of(context).edit+" "+field) ,
        content: TextField(
        autofocus: true,
          decoration: InputDecoration(
            hintText: S.of(context).enterNew+" "+field,
          ),
          onChanged: (value){
            newValue=value;
          },
        ),
        actions: [
          TextButton(
      child: Text(S.of(context).cancel,style: TextStyle(color: Colors.indigo),),
            onPressed: ()=>Navigator.pop(context),
          ),

          TextButton(
            child: Text(S.of(context).save, style: TextStyle(color: Colors.indigo)),
            onPressed: () {
              if (field == 'Email' && !newValue.endsWith('@suqia.com')) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.of(context).error),
                      content: Text(S.of(context).emailErrorMes),
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
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.of(context).updateInformation),
                      content: Text(field+" "+S.of(context).updatedsuccessfully),
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
                ).then((_) {
                  setState(() {
                    // Update initial values with the new value
                    if (field == 'First Name') {
                      initialFirstName = newValue;
                    } else if (field == 'Last Name') {
                      initialLastName = newValue;
                    } else if (field == 'Email') {
                      initialEmail = newValue;
                    }
                    // You can handle other fields similarly
                  });
                  Navigator.of(context).pop(newValue);
                });
              }
            },
          ),
        ],
      ),
  ); if(newValue.trim().length>0){
    await FirebaseFirestore.instance
        .collection('Employees')
        .doc(currentUser?.uid)
        .update({field:newValue});
  }
  }



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
        title: Text(S.of(context).editProfile),
        centerTitle: true,
        backgroundColor: Color(0xFFF1F2F3),
        titleTextStyle: TextStyle(
          color: Color(0xff004AAB),
          fontSize: 24,
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('Employees').doc(currentUser?.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }else if (snapshot.hasData &&snapshot.data != null) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final UpdateInfo=FirebaseFirestore.instance.collection('Employees');
            initialFirstName= userData['First Name'];
            initialLastName =userData['Last Name'];
            initialEmail = userData['Email'];
            initialPassword= userData['Password'];
            if(userData!=null){
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F2F3), // Gray background
                          borderRadius: BorderRadius.circular(10), // Soft edges
                        ),
                        padding: EdgeInsets.all(16),
                        // Padding for the container
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).firstName,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff004AAB),
                              ),
                            ),
                            SizedBox(height: 18),
                            Container(
                              decoration:  BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        initialFirstName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        edit('First Name');
                                      },
                                      icon: Icon(Icons.settings),
                                      color:Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              S.of(context).lastName,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff004AAB),
                              ),
                            ),
                            SizedBox(height: 18),
                            Container(
                              decoration:  BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        initialLastName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        edit('Last Name');
                                      },
                                      icon: Icon(Icons.settings),
                                      color:Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              S.of(context).email,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff004AAB),
                              ),
                            ),
                            SizedBox(height: 18),
                            Container(
                              decoration:  BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        initialEmail,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        edit('Email');
                                      },
                                      icon: Icon(Icons.settings),
                                      color: Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Text(
                              S.of(context).password,
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff004AAB),
                              ),
                            ),
                            SizedBox(height: 18),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        initialValue: initialPassword,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                        obscureText: _isObscure,
                                        readOnly: true, // Ensures the text cannot be edited
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Toggle password visibility
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                      child: Icon(
                                        _isObscure ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 30,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                                );
                                },
                              child: Text(
                                S.of(context).ressetPasswod,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff004AAB),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );}
          } else if (snapshot.hasError) {
            return Center(child: Text(S.of(context).error));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
