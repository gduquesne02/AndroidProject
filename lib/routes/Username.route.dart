import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/shared_pref.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameRoute extends ConsumerWidget {
  UsernameRoute({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Veuillez choisir votre username'),
          TextField(
            controller: _controller,
          ),
          ElevatedButton(onPressed: () async {
            final String username = _controller.text.trim();
            if(username.isEmpty){
              return;
            }
            var sharedPref = await SharedPreferences.getInstance();
            sharedPref.setString('username', username).then((value) {
              ref.refresh(usernameProvider);
            });
          }, child: Text('Valider'))
        ],
      ),
    );
  }
}
