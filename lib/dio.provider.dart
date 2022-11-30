import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final dioProvider = Provider<Dio>((ref) {
  var baseOptions = BaseOptions(
    baseUrl:'https://backend.smallwords.samyn.ovh',
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );
  //Construction de Dio avec les options
  return Dio(baseOptions);
});

//Provider du numéro de version du backend
final backendVersionProvider = FutureProvider<String>((ref) async {
  // On récupère l'instance de Dio
final dio = ref.read(dioProvider);

  // On fait une requête Get sur l'URL /up
final response = await dio.get('/up');

  //On retourne la réponse
return response.data;
});