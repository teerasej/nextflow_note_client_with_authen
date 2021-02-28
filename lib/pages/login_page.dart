import 'package:flutter/material.dart';
import 'package:nextflow_note_client_with_authen/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
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
    );
  }
}
