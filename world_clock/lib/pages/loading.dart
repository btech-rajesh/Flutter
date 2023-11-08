import 'package:flutter/material.dart';
import 'package:world_clock/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time='loading';


  void setupWorldTime() async {
    WorldTime instance=WorldTime(location: 'India', flag: 'kolkata.png', url:'Asia/Kolkata' );
await  instance.getTime();

Navigator.pushReplacementNamed(context, '/home',arguments: {
  'location':instance.location,
  'flag':instance.flag,
  'time':instance.time,
  'isDaytime':instance.isDaytime,
});
// print(instance.time);
// setState(() {
//   time=instance.time;
// });
  }
  @override
  void initState(){
    super.initState();
  setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child:SpinKitCircle(
          color: Colors.white,
          size: 90.0,
        ),
        ),



    );
  }
}
