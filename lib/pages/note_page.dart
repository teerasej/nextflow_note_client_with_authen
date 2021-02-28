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
    var dio = Connection.getDio();
    dio.options.headers['Authorization'] = "Bearer ${TokenManager.userToken}";

    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึก'),
      ),
      body: FutureBuilder(
        future: dio.get('/notes'),
        builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List items = snapshot.data.data;

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];

                return ListTile(
                  title: Text(item['message']),
                );
              },
            );
          }

          return LinearProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var isNoteCreated = await Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return NoteCreatePage();
            }),
          );

          if (isNoteCreated) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
