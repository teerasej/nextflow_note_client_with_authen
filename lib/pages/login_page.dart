import 'package:flutter/material.dart';
import 'package:nextflow_note_client_with_authen/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
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
                initialValue: 'pon@gmail.com',
                validator: (String email) {
                  if (email.isEmpty) return 'Please fill in email';
                  return '';
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
                initialValue: '1234',
                obscureText: true,
                validator: (String password) {
                  if (password.isEmpty) return 'Please fill in password';
                  return '';
                },
                onSaved: (String password) {
                  _password = password;
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  },
                  child: Text('Sign in'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ),
                    );
                  },
                  child: Text('Need sign up?'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
