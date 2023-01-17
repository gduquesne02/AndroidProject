
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/DbHelper.dart';

class AddWord extends StatelessWidget {

  final DbHelper _dbHelper = DbHelper.instance;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Text("Veuillez insérer votre mot : "),
            TextFormField(
              decoration: InputDecoration(

                labelText: 'Mon mot',
              ),
            ),
            SizedBox(height: 16,),
            FloatingActionButton(
              onPressed: () {
                //_dbHelper.insert();
              },
              child: Icon(Icons.add, color: Colors.black,),
              backgroundColor: Colors.grey,

            ),
          ],
        ),
      ),

    );
  }
}
