



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'WordCountProvider.dart';
import 'dio.provider.dart';

class WordCount extends StatelessWidget{


  const WordCount({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final AsyncValue<int> read = ref.watch(WordCountProvider);

        return read.when(data: (int data) {
          //On a la donnée, on veut l'afficher
          return Text(data.toString());
        }, error: (error, stack) {
          return const Text('Impossible de récupérer la version du back');
        }, loading: () {
          return const CircularProgressIndicator();
        });
      },
    );
  }
}