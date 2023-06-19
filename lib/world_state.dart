import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Model/WorldStateModel.dart';
import 'Services/state_services.dart';
class WorldSatate extends StatefulWidget {
  const WorldSatate({Key? key}) : super(key: key);

  @override
  State<WorldSatate> createState() => _WorldSatateState();
}

class _WorldSatateState extends State<WorldSatate> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController( duration:const Duration(seconds: 3),vsync: this,)..repeat();


  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height : 30),

              FutureBuilder(
                  future: stateServices.fetchWorldStateRecord(),
                  builder: (
                  context, AsyncSnapshot<WorldStateModel> snapshot){
                    if(!snapshot.hasData){
                      return Expanded(
                        flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.blue,
                            size: 50,
                            controller: _controller,

                      ));
                    }else{
                      return Column(
                        children: [
                          PieChart(
                            dataMap:  {
                              "Total": 20,
                              "Recovered":15,
                              "Death":5,
                            },
                            animationDuration:  Duration(milliseconds: 1200),
                            // chartType: ChartType.ring,
                            // colorList: colorList ,
                            legendOptions: LegendOptions(
                              legendPosition: LegendPosition.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric( vertical: 10),
                            child: Card(
                              child: Column(
                                children: [
                                  Reusable(title: 'Total', value: '100'),
                                  Reusable(title: 'Total', value: '100'),
                                  Reusable(title: 'Total', value: '100'),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text("Track"),),
                            ),
                          )
                        ],
                      );

                    }
              }),



            ],
          ),
        ),
      ),
    );
  }
}

class Reusable extends StatelessWidget {
  final String title,value;
   const Reusable({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),

            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

