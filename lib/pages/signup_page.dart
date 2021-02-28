import 'package:flutter/material.dart';

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
