import 'package:flutter/material.dart';
import 'package:rest_api/Services/state_services.dart';
import 'package:rest_api/detail_screen.dart';
import 'package:shimmer/shimmer.dart';
class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search County",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                )
              ),
            ),),
            Expanded(child: FutureBuilder(
              future: stateServices.CountryRecordApi(),
              builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
                if(!snapshot.hasData){
                   return ListView.builder(
                     itemCount: 9,
                     itemBuilder: (context,index){
                       return Shimmer.fromColors(
                         child: Column(
                           children: [
                             ListTile(
                               title: Container(height: 10,width: 89,color: Colors.grey,),
                               subtitle: Container(height: 10,width: 89,color: Colors.grey,),
                               leading: Container(height: 50,width: 50,color: Colors.grey,),
                             )
                           ],
                         ),
                         baseColor: Colors.blue.shade500,
                         highlightColor: Colors.blue.shade100,);

                     },

                   );

                }else{
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        String name = snapshot.data![index]['country'];
                        if(searchController.text.isEmpty){
                          return Column(
                            children: [
                              InkWell(
                                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                                  image: snapshot.data![index]["countryInfo"]["flag"],
                                  name: snapshot.data![index]["country"],
                                  recovered: snapshot.data![index]['recovered'],
                                  totalCases: snapshot.data![index]['cases'],
                                  test: snapshot.data![index]['tests'],
                                  totalDeaths: snapshot.data![index]['deaths'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                  critical: snapshot.data![index]['critical'],
                                  active: snapshot.data![index]['active'],
                                  cases: snapshot.data![index]['recover'],


                                )));},
                                child: ListTile(
                                  leading: Image(
                                    height:50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']['flag'],
                                    ),
                                  ),
                                  title: Text(snapshot.data![index]["country"]),
                                  subtitle: Text(snapshot.data![index]["cases"].toString()),
                                ),
                              )

                            ],
                          );

                        }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                          return Column(
                            children: [
                              ListTile(
                                leading: Image(
                                  height:50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag'],
                                  ),
                                ),
                                title: Text(snapshot.data![index]["country"]),
                                subtitle: Text(snapshot.data![index]["cases"].toString()),
                              )

                            ],
                          );

                        }else{
                          return Container();

                        }

                  });

                }

              },
            ))
          ],
        ),
      ),

    );
  }
}
