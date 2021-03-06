import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nextflow_note_client_with_authen/connection.dart';
import 'package:nextflow_note_client_with_authen/token_manager.dart';

class NoteCreatePage extends StatefulWidget {
  @override
  _NoteCreatePageState createState() => _NoteCreatePageState();
}

class _NoteCreatePageState extends State<NoteCreatePage> {
  final _formKey = GlobalKey<FormState>();

  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Message:'),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (String message) {
                  if (message.isEmpty) {
                    return 'Please fill in message';
                  }
                  return null;
                },
                onSaved: (String message) {
                  _message = message;
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      var data = {"message": _message};

                      var dio = Connection.getDio();
                      dio.options.headers['Authorization'] =
                          "Bearer ${TokenManager.userToken}";

                      final response = await dio.post(
                        '/notes',
                        data: json.encode(data),
                      );

                      if (response.statusCode == 200) {
                        Navigator.pop(context, true);
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
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
