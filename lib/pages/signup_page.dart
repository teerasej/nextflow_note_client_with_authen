import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nextflow_note_client_with_authen/connection.dart';

import '../token_manager.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email:'),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (String email) {
                  if (email.isEmpty) {
                    return 'Please fill in email';
                  }
                  return null;
                },
                onSaved: (String email) {
                  _email = email;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Password:'),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                validator: (String password) {
                  if (password.isEmpty) {
                    return 'Please fill in password';
                  }
                  return null;
                },
                onSaved: (String password) {
                  _password = password;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      var data = {"email": _email, "password": _password};

                      final response = await Connection.getDio().post(
                        '/signup',
                        data: json.encode(data),
                      );

                      if (response.statusCode == 200 &&
                          response.data['user']['ok'] == 1) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Success!'),
                              content: Text(
                                  'Registration success! Please login with your account.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text('ok'),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Opps...'),
                              actions: [
                                TextButton(
                                  child: Text('close'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  child: Text('Sign up'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
