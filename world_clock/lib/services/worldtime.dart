import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
class WorldTime{
 String location;//location for the ui
 String? time;//time in that location;//we ? for null or '';
 String flag;//url to an asset flag icon
 String url;//location url for api endpoint
 late bool isDaytime;


  WorldTime({
    required this.location,required this.flag,required this.url});
  Future<void> getTime() async {
    try{
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // print(data);


      //get properties from data
      String dateTime = data['datetime'];
      String zone = data['timezone'];
      String offset = data['utc_offset'];
      // print(dateTime);
      //  print(zone);
      //  print(offset);

      //create datetime obj

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      now = now.add(Duration(minutes: int.parse(offset.substring(4, 6))));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }

    catch (e) {
      print("error occured: $e");
      time="Data  is not fetch";
    }
  }
}