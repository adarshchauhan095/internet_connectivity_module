import 'package:flutter/material.dart';

import 'connectivity_module.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:
              connectivityStatus == 'Offline'
                  ? Material(
                    child: Text('No Internet', style: TextStyle(fontSize: 18)),
                  )
                  : Material(
                    child: Text('Connected', style: TextStyle(fontSize: 18)),
                  ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }
}

void main() => runApp(MyApp());
