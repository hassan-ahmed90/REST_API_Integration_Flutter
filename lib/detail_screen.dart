
import 'package:flutter/material.dart';
import 'package:rest_api/world_state.dart';
class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int cases;
  int recovered;
  int active;
  int test;
  int critical;
  int totalCases;
  int todayRecovered;
  int totalDeaths;
  // int totalRecovered;
  // int totalDeaths, totalRecovered, totalCases, active, critical , todayRecovered, test;
  DetailScreen({
    required this.recovered,
    required this.cases,
    required this.name,
    required this.image,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.test,
    required this.totalCases,
    required this.totalDeaths,
    //required this.totalRecovered,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(padding: EdgeInsets.all(10),
                child:  Card(
                 // color: Colors.grey.shade400,
                  child: Column(
                    children: [
                      Reusable(title: "Cases", value: widget.cases.toString()),
                      Reusable(title: "Reovered", value: widget.recovered.toString()),
                      Reusable(title: "Active", value: widget.active.toString()),
                      Reusable(title: "Deaths", value: widget.totalDeaths.toString()),
                      Reusable(title: "Test", value: widget.test.toString()),
                      Reusable(title: "Critical", value: widget.critical.toString()),
                      Reusable(title: "Todays Recovered", value: widget.todayRecovered.toString()),
                      //Reusable(title: "Total Recovered", value: widget.totalRecovered.toString()),
                    ],
                  ),
                ),),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// class  DetailScreen extends StatefulWidget {
//
//   final String image;
//   final String name;
//   final int totalCase,totalDeaths,totalRecovered,active,recover,critical,todayRecovered,test;
//    const DetailScreen({Key? key,
//   required this.todayRecovered,
//      required this.totalRecovered,
//     required this.critical,
//     required this.active,
//     required this.name,
//     required this.image,
//     required this.test,
//     required this.totalDeaths,
//     required this.recover,
//     required this.totalCase,
//
//   }) : super(key: key);
//
//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }
//
// class _DetailScreenState extends State<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(""),
//       ),
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               // CircleAvatar(
//               //   radius: 60,
//               //   backgroundImage: NetworkImage(widget.image),
//               // )
//             ],
//           )
//         ],
//       ),
//
//     );
//   }
// }
