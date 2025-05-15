import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{

  Widget build (BuildContext){
    return Scaffold(
      appBar: AppBar(
        title:const Text('FlutterChat'),
      ),
      body: const Center(child: Text("Loading..."),),
    );
  }
}