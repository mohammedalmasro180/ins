
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/theme/theme.dart';

import '../../../utils/clients/client.dart';
import '../../Task/Task.dart';

class Slider_Task extends StatefulWidget {
  final Color bk;
  final Color txt;
  const Slider_Task({Key? key ,required this.bk,required this.txt}) : super(key: key);

  @override
  _Slider_TaskState createState() => _Slider_TaskState();
}

class _Slider_TaskState extends State<Slider_Task> {
  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
          future: Client.mhdgetFeedbacks(),
          builder:(BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return

                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Scrollbar(
                    child:
                    CarouselSlider(
                      options: CarouselOptions(height: 140.0),
                      items: [0,1,2].map((i) {
                        return Builder(

                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return

                                        Task(name:  snapshot.data[i]['customer']['name'].toString(), status: snapshot.data[i]['status'].toString(), time:
                                        snapshot.data[i]['review_at'].toString(), type:
                                        snapshot.data[i]['type'].toString(),

                                          description: snapshot.data[i]['description'].toString(),
                                        );
                                    }));

                              },
                              child: Container(
                                width:  double.infinity,
                                //                        margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: widget.bk,
                                  boxShadow:
                                  <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius:  5.0,
                                        offset: Offset(0.0, 0.75)
                                    ),
                                  ],

                                ),

                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                      children: [

                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Container(
                                              width: 9,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadiusDirectional.only(

                                                ),
                                                color: Colors.deepOrange,
                                              ),
                                            ),
                                          ),

                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                //crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //                 textDirection:TextDirection.ltr,
                                                children: [

                                                  Text("Customer: " ,style: TextStyle(fontSize: 12,color: widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
                                                  Text(    snapshot.data[i]['customer']['name'].toString()
                                                    ,style: TextStyle(fontSize: 15,color: widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
                                                ],
                                              ),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                //                 textDirection:TextDirection.ltr,
                                                children: [

                                                  Text("Status: " ,style: TextStyle(
                                                      fontSize: 15,color: widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                                  Text(snapshot.data[i]['status'].toString(),style: TextStyle(fontSize: 15,color: widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),

                                                ],
                                              ),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                //                 textDirection:TextDirection.ltr,
                                                children: [

                                                  Text("Type: " ,style: TextStyle(fontSize: 15,color:widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                                  Text( snapshot.data[i]['type'].toString(), style: TextStyle(fontSize: 15,color: widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                                ],
                                              ),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                //                 textDirection:TextDirection.ltr,
                                                children: [

                                                  Text("Time: " ,style: TextStyle(fontSize: 15,color: widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                                  Text(
                                                    snapshot.data[i]['review_at'].toString(),
                                                    style: TextStyle(fontSize: 15,color: widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
            }

            else
              return Container(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/ld.gif",width: 25,height: 25));
          }

      );



  }
}
