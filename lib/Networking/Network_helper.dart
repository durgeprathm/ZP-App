import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper
{
  NetworkHelper({this.apiname,this.data});
  final String apiname;
  var data;
  final String baseurl = "https://scrollnsolve.com/flutter_api/";
  Future getData() async
  {
    var url = baseurl+apiname;
    var response = await http.post(Uri.parse(url), body: data);
    if(response.statusCode == 200)
    {
      var data = jsonDecode(response.body);
      return data;
    }
    else
    {
      print(response.statusCode);
    }

  }

}