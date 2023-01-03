import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/WordCount.dart';
import 'package:littlewords/dio.provider.dart';
import 'package:littlewords/routes/Error.route.dart';
import 'package:littlewords/routes/Loading.route.dart';
import 'package:littlewords/routes/Username.route.dart';
import 'package:littlewords/shared_pref.provider.dart';
import 'package:littlewords/version.dart';


void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ref.watch(usernameProvider).when(data: _data, error: _error, loading: _loading)
    );
  }
  Widget _data(String? username) {
    if (null == username) {
      return UsernameRoute();
    }

    print('username $username');
    return MyHomePage(title: 'littlewords');
  }
  Widget _error(error, stack){
    return ErrorRoute();
  }
  Widget _loading() {
    return LoadingRoute();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children : [

          Version(),

          WordCount(),

          FlutterMap(
            options:
            MapOptions(center: LatLng(_position.latitude, _position.longitude), zoom: 10),
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: null,
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
      );

  }
}



