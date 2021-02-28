import 'package:flutter/material.dart';
import 'package:nextflow_note_client_with_authen/connection.dart';
import 'package:nextflow_note_client_with_authen/token_manager.dart';

class NotePage extends StatelessWidget {
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
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container();
          }

          return LinearProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
