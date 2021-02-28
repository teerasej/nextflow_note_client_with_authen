import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email:'),
            SizedBox(
              height: 10,
            ),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            Text('Password:'),
            SizedBox(
              height: 10,
            ),
            TextFormField(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
                child: Text('Sign up'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
