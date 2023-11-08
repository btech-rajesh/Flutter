import 'package:flutter/material.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loading.dart';
void main() =>runApp(MaterialApp(
debugShowCheckedModeBanner: false,
initialRoute: '/loading',
  routes: {
    '/loading':(context)=>const Loading(),
    '/home':(context)=>const Home(),
    '/location':(context)=>const Chooselocation(),
  },
));
