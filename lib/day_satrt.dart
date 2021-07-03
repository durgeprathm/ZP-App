import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'Constant/const.dart';

class DayStart extends StatefulWidget {
  @override
  _DayStartState createState() => _DayStartState();
}

class _DayStartState extends State<DayStart> {
  var myFormat = DateFormat('yyyy-MM-dd - kk:mm:ss');
  DateTime selectedDate = DateTime.now();
  PickedFile image;
  File fileimage = null;
  String cureentlocation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCureentLocation();
  }

  getCureentLocation() async {
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    getAddressFromCordinates(position.latitude, position.longitude);
    // var locationOptions =
    //     LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    // StreamSubscription<Position> positionStream =
    //     Geolocator.getPositionStream().listen((Position position) {
    //   print(position == null
    //       ? 'Unknown'
    //       : position.latitude.toString() +
    //           ', ' +
    //           position.longitude.toString());
    // });
  }

  getAddressFromCordinates(latitude, longitude) async {
    print(latitude);
    print(longitude);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    var address = placemarks[0].street.toString();
    print("////country/////////////////////////${placemarks[0].country.toString()}");
    print("////administrativeArea/////////////////////////${placemarks[0].administrativeArea.toString()}");
    print("////locality/////////////////////////${placemarks[0].locality.toString()}");
    print("////subAdministrativeArea/////////////////////////${placemarks[0].subAdministrativeArea.toString()}");
    print("////postalCode/////////////////////////${placemarks[0].postalCode.toString()}");
    print("////street/////////////////////////${placemarks[0].street.toString()}");
    print("////name/////////////////////////${placemarks[0].name.toString()}");

    setState(() {
      cureentlocation = address.toString();
      print("cureentlocation////////////${cureentlocation}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Day Start"),
          actions: [
            Text("${cureentlocation}"),
          ],
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Start Date & Time:"),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "${myFormat.format(selectedDate).toString()}",
                      style: TextStyle(
                          color: Color(0xff409b94),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Click Photo:"),
              ),
              fileimage == null
                  ? Center(
                      child: GestureDetector(
                        onTap: () async {
                          final _picker = ImagePicker();
                          image = await _picker.getImage(
                              source: ImageSource.camera);
                          setState(() {
                            fileimage = File(image.path);
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff409b94))),
                            child: Image.asset(
                              "Images/3901.png",
                              width: 175,
                            )),
                      ),
                    )
                  : Center(
                      child: Image.file(fileimage, width: 175),
                    ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Material(
                  color: Primarycolur,
                  borderRadius: BorderRadius.circular(15.0),
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.solidSave,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "Day Start",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                    minWidth: 150,
                    height: 25.0,
                    onPressed: () async {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                        msg: "Day Started",
                        toastLength: Toast.LENGTH_LONG,
                        backgroundColor: Primarycolur,
                        textColor: Color(0xffffffff),
                        gravity: ToastGravity.BOTTOM,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ))));
  }
}
