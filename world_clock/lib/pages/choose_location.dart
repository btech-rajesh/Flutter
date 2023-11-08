import 'package:flutter/material.dart';
import 'package:world_clock/services/worldtime.dart';
import 'package:world_clock/services/worldtime.dart';
class Chooselocation extends StatefulWidget {
  const Chooselocation({super.key});

  @override
  State<Chooselocation> createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {

  List<WorldTime> locations =[
    WorldTime(url: 'Asia/Kolkata',location: 'India', flag: 'kolkata.png'),
    WorldTime(url: 'Europe/London',location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location:'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Europe/Moscow',location: 'Moscow', flag: 'Moscow.png'),
    WorldTime(url: 'America/Chicago',location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location:'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location:'South Korea', flag: 'SouthKorea.png'),
    WorldTime(url: 'Asia/Jakarta', location:'Jakarta', flag: 'indonesia.png'),
  ];
  void updatetime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
        itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child:ListTile(
                  onTap: (){
                 print(locations[index].location);
                 updatetime(index);
        },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
        }
      ),
    );
  }
}
