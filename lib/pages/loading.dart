import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'holas';


  void setupWorldTime() async {
    WorldTime instance = WorldTime('n','ger','Be');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'datetime': instance.datetime,
      'clientip': instance.clientip,
      'timezone': instance.timezone
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}