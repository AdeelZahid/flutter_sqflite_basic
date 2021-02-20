import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database_healper.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SqfLite Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: () async {
                  int i = await DatabaseHelper.instance
                      .insert({DatabaseHelper.columnName: 'fasdfaf'});
                  print('Inserted id is $i');
                },
                child: Text('Insert'),
                color: Colors.green),
            FlatButton(
                onPressed: () async {
                  List<Map<String, dynamic>> queryRows =
                      await DatabaseHelper.instance.queryAll();
                  print(queryRows);
                },
                child: Text('Query All'),
                color: Colors.grey),
            FlatButton(
                onPressed: () async {
                  int updateId = await DatabaseHelper.instance.update({
                    DatabaseHelper.columnId: 1,
                    DatabaseHelper.columnName: 'MianSahib'
                  });
                  print(updateId);
                },
                child: Text('update'),
                color: Colors.orange),
            FlatButton(
                onPressed: () async {
                  int rowsEffected = await DatabaseHelper.instance.delete(1);
                  print(rowsEffected);
                },
                child: Text('delete'),
                color: Colors.red),
          ],
        ),
      ),
    );
  }
}
