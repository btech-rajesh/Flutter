import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:world_clock/pages/home.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
Map data={};
  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments;


    String value = json.encode(argument) as String;
    data = data.isNotEmpty ? data :json.decode(value);//this is used becoz we need argument of these in location file
 // print(data);

 //set background
String BgImage=data['isDaytime']?'assets/day.jpg':
                                 'assets/night (1).jpg';
// Color bgColor=data['isDaytime'] ? Colors.blue:Colors.indigo[700];
 return Scaffold(
   // backgroundColor: Color,
      body:SafeArea (
      child:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(BgImage),
            fit: BoxFit.cover,

          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 130.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton(onPressed: () async {
               dynamic result=await Navigator.pushNamed(context, '/location');
               setState((){
               data={
                   'time':result['time'],
                   'location':result['location'],
                   'isDaytime':result['isDaytime'],
                   'flag':result['flag']
                 };
               }

               );
              },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.edit_location,
                      color: Colors.grey[300],
                    ),

                    Text(
                        "Edit location",
                        style: TextStyle(
                          color: Colors.white,
                           fontSize: 30.0,
                             letterSpacing: 2.0
                         ),
                    ),
                  ],
                ),

          ),
              SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                data['location'],
                style: TextStyle(
                  color: Colors.orange,
                    fontSize: 45.0,
                    letterSpacing: 2.0
                ),
              ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                    fontSize: 65.0,
                    letterSpacing: 2.0
                ),
              )
          ],
          ),
        ),
      ),
      ),
    );
  }
}
