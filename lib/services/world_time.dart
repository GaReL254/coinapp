import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String timezone;
  String clientip;
  String datetime;


  WorldTime(this.timezone, this.clientip, this.datetime);

  Future<void> getTime() async {

    try{
      // make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/ip'));
      Map data = jsonDecode(response.body);
      print('ledata $data');

      // set the time property
      timezone = data['timezone'];
      clientip = data['client_ip'];
      datetime = data['datetime'];
    }
    catch (e) {
      print(e);
      datetime = 'could not get time';
    }

  }
}