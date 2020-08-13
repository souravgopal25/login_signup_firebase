import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_firebase/services/auth.dart';

import 'home_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final emailController = TextEditingController();
    final passwrodController = TextEditingController();
    final phoneController = TextEditingController();
    final nameController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text("SignUP Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              "https://images.unsplash.com/photo-1529539795054-3c162aab037a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Name Required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Name",
                                      labelText: "Name"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  maxLength: 13,
                                  controller: phoneController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Phone Required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Phone with Nation Code ",
                                      labelText: "Phone No"),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Email Required";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Email",
                                      labelText: "Email"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  maxLength: 10,
                                  validator: (String value) {
                                    if (value.length<6) {
                                      return "Pass Required";
                                    }
                                    return null;
                                  },
                                  controller: passwrodController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Password",
                                      labelText: "Password"),
                                )
                              ],
                            ),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if(!_formKey.currentState.validate()){
                              return;
                            }else{
                              print('EMAIL : ${emailController.text}');
                              dynamic result = await _auth.signUpWithEmail(
                                  emailController.text, passwrodController.text);
                              if (result == null) {
                                print("TRY AGAIN");
                              } else {
                                print("Success");
                                print(result);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            }
                          },
                          focusElevation: 10,
                          textColor: Colors.white,
                          child: Text(
                            "Sign-UP",
                          ),
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
