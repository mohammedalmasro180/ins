import 'package:carousel_slider/carousel_slider.dart';
import 'package:insoft_online_support/screens/Dashboard/Dashboard_done.dart';
import 'package:insoft_online_support/screens/Dashboard/FeedbackList.dart';
import 'package:insoft_online_support/screens/home%20page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/screens/Dashboard/FeedbackList.dart';
import 'package:insoft_online_support/theme/theme.dart';
import 'package:insoft_online_support/theme/theme_colors.dart';

import '../../utils/clients/client.dart';
import '../Task/Task.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}
bool mode=true;
class _DashboardState extends State<Dashboard> {

  late PageController pageController;
  @override

  void initState() {
    String md='';
    pageController = PageController(initialPage: 1, viewportFraction: 0.75);
    // TODO: implement initState
    getmode(md);

    super.initState();
  }
  @override
  void dispose() {
    //_pageController.dispose();

    // TODO: implement dispose
    super.dispose();
  }
  //TabController tabController=TabController(length: 3, vsync: this);
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
Color appbar;
Color continer;
Color txt;
Color bk;
Color mywhite;
if(mode)
{
  appbar=bluLayerone;
  continer=bluLayerfive;
  txt=bluLayerfive;
  mywhite=Colors.white;

  bk=bluLayerfive;

}
else
{
  appbar=Colors.black;
  continer=Colors.white;
  txt=Colors.white;
  bk=Colors.black;
  mywhite=Colors.black;

}


return Scaffold(
      backgroundColor:
      mode?
      mybkg:Colors.black,

      appBar: AppBar(

        title: Text("Dashboard",style: TextStyle(color: txt),),
        backgroundColor: appbar,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.update,size: 25,color: bluLayerfive,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings,size: 25,color: bluLayerfive,),
              ),

              Switch(
     value: mode,
              onChanged: (value) {
                setState(() {
                  mode = value;
                  saveperf(value.toString() );
                });
              }),
    ]
    ),

        ],
      ),

      body: Container(
        //color: Colors.white,
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 color:continer,
                 height: 150,
                 width: MediaQuery.of(context).size.width-10,
               child: Column(

                 children: [
                   Text("Today`s New Reports:"+"   "+'5',
                     style:
                     TextStyle(color: mywhite,fontSize: 30),),
                   Text("Today`s Assi Reports:"+"   "+'5',style:
                   TextStyle(color: mywhite,fontSize: 30),
                   ),
                   Text("Today`s Done Reports:"+"   "+'5',style: TextStyle(color: mywhite,fontSize: 30),),


                 ],
               ),),
             ),
            Container(
              color: mywhite,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Tasks" ,style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500),),
                      Text("Assigned" ,style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500),),
                      Text("to me" ,style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500),),



                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: bluLayerfive,
                      height: 100,
                      width: 10,
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width-118,
                      child: Slider(bk: mywhite,txt: txt,)

                    ),
                  )




              ],
              ),
            ),
            Container(
              color: mywhite,
              width: double.infinity,
                height: MediaQuery.of(context).size.width-10,

              child:MyHomePage(bk: mywhite,txt: txt,)
            )


          ],
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
final Color bk;
final Color txt;
  const Slider({Key? key ,required this.bk,required this.txt}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
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
                  child: CarouselSlider(
                    options: CarouselOptions(height: 140.0),
                    items: [0,1,2,].map((i) {
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
                              width:  MediaQuery.of(context).size.width,
    //                        margin: const EdgeInsets.all(1),
                              decoration: MyThemes.cardDecoration(context),

                              child: Container(
                                width: MediaQuery.of(context).size.width-45,
                                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: widget.bk
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
                                                  Text(snapshot.data[i]['status'].toString(),style: TextStyle(fontSize: 15,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),

                                                ],
                                              ),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                //                 textDirection:TextDirection.ltr,
                                                children: [

                                                  Text("Type: " ,style: TextStyle(fontSize: 15,color:widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                                  Text( snapshot.data[i]['type'].toString(), style: TextStyle(fontSize: 15,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),
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
                            ),
                          );
                        },
                      );
                    }).toList(),
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

/// stateful widget that the main application instantiates
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// private State class that goes with MyStatefulWidget
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
    );
  }
}

saveperf(String mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("mode", mode);
  print(sharedPreferences.get("mode"));

}
getmode(String   mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
 //mode=bool.hasEnvironment( sharedPreferences.get("mode").toString());
  mode=sharedPreferences.get("mode").toString();
 print(mode);

}



class MyHomePage extends StatefulWidget {
final Color bk;
final Color txt;

const MyHomePage({Key? key,required this.bk,required this.txt}) : super(key: key);

@override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: widget.bk,
        appBar: AppBar(
          backgroundColor: widget.bk,
          bottom:
          TabBar(indicatorColor: Colors.deepOrange,
            labelStyle: TextStyle(color: Colors.black,fontSize: 15),
            //indicatorColor: Colors.deepOrange,
            unselectedLabelColor:widget.txt,

            labelColor: Colors.white,

            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bluLayerfive),

            tabs: [
              Tab( text: "All",),
              Tab( text: "Unassigned"),
              Tab( text: "Done"),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            FeedbackList(txt: widget.txt, bk: widget.bk),

            Unassigned(txt: widget.txt, bk: widget.bk),
            dashbpard_done(txt: widget.txt, bk: widget.bk),

          ],
        ),
      ),
    );
  }
}