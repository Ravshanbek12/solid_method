import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NativeApp(),
    );
  }
}


class NativeApp extends StatefulWidget {
  const NativeApp({super.key});

  @override
  State<NativeApp> createState() => _NativeAppState();
}

class _NativeAppState extends State<NativeApp> {
  final platform = const MethodChannel('org.nt.main');

  Future<int> getBatteryLevel() async {
    try {
      final batteryLevel = await platform.invokeMethod<int>('getBatteryLevel');

      if (batteryLevel != null) {
        return batteryLevel;
      }
    } on PlatformException catch (e) {
      print(e.message);
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getBatteryLevel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child:  Text("Battery level: ${snapshot.data}"),
            );
          } else {
            return const Center(child: CupertinoActivityIndicator());
          }
        },

      ),
    );
  }
}