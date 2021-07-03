import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Pages/teaching_plan_ideal.dart';

import 'implemented_plan.dart';

class TeachingPlan extends StatefulWidget {
  @override
  _TeachingPlanState createState() => _TeachingPlanState();
}

List<String> titleList = [
  "Ideal Teaching Plan",
  "Implemented Teaching Plan",
];
List<String> iconList = [
  "Images/idea.png",
  "Images/lecture (1).png",
];

class _TeachingPlanState extends State<TeachingPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teaching Plan"),
        backgroundColor: Primarycolur,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: .90,
              children: List.generate(2, (index) {
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IdealPlan()));
                        }
                        break;
                      case 1:
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Implemented()));
                        }
                        break;
                    }
                  },
                  child: Card(
                    elevation: 3,
                    // shape: RoundedRectangleBorder(
                    //     side: new BorderSide(color: Primarycolur, width: 1.0),
                    //     borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 30,
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 6,
                            height: MediaQuery.of(context).size.height / 7,
                            child: Image.asset(
                              iconList[index],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 6.0, right: 6.0),
                            child: Text(
                              titleList[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Primarycolur),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.all(10.0),
//   child: Container(
//     height: 75,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         border: Border.all(
//           color: Primarycolur,
//           width: 2,
//         )),
//     child: ListTile(
//         title: Padding(
//             padding: EdgeInsets.only(
//                 left: 15.5, bottom: 15.0, top: 15.5, right: 10.5),
//             child: Text(
//               "Ideal Teaching Plan",
//               style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold),
//             )),
//         trailing: Padding(
//           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//           child: FaIcon(
//             FontAwesomeIcons.chevronCircleRight,
//             size: 30,
//             color: Primarycolur,
//           ),
//         ),
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => IdealPlan()));
//         }),
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.all(10.0),
//   child: Container(
//     height: 85,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//         border: Border.all(
//           color: Primarycolur,
//           width: 2,
//         )),
//     child: ListTile(
//         title: Padding(
//             padding: EdgeInsets.only(
//                 left: 15.5, bottom: 10.0, top: 15.5, right: 10.5),
//             child: Text(
//               "Implemented Teaching Plan",
//               style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold),
//             )),
//         trailing: Padding(
//           padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//           child: FaIcon(FontAwesomeIcons.chevronCircleRight,
//               size: 30, color: Primarycolur),
//         ),
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => Implemented()));
//         }),
//   ),
// )
