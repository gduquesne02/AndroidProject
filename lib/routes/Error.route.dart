import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text('Impossible de récuperer le uusername',
            style: TextStyle(color: Colors.white),
          ),

        ),
      ),
    );
  }
}
