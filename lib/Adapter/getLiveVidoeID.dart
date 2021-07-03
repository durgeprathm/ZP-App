
import 'package:zpapp/Networking/Network_helper.dart';

class LiveLectureData {

  Future <dynamic> getLiveVideoData (String USERNAME,String STUDID,String CLASS) async
  {
    var map = new Map<String, dynamic>();
    map['username'] = USERNAME;
    map['studid'] = STUDID;
    map['class'] = CLASS;

    String apifile = 'liveid_fetch.php';
    NetworkHelper networkHelper = new NetworkHelper(apiname: apifile,data: map);
    var profiledata = await networkHelper.getData();
    return profiledata;
  }

}