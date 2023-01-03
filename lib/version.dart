



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dio.provider.dart';

class Version extends StatelessWidget{


const Version({Key? key}) : super(key: key);

@override

Widget build(BuildContext context) {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final AsyncValue<String> read = ref.watch(backendVersionProvider);

      return read.when(data: (String data) {
        //On a la donnée, on veut l'afficher
        return Text(data);
      }, error: (error, stack) {
        return const Text('Impossible de récupérer la version du back');
      }, loading: () {
        return const CircularProgressIndicator();
      });
    },
  );
}
}