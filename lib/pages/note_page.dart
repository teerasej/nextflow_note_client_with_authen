import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nextflow_note_client_with_authen/connection.dart';
import 'package:nextflow_note_client_with_authen/pages/note_create_page.dart';
import 'package:nextflow_note_client_with_authen/token_manager.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึก'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
