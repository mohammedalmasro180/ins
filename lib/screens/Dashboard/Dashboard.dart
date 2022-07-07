import 'package:carousel_slider/carousel_slider.dart';
import 'package:insoft_online_support/main.dart';
import 'package:insoft_online_support/screens/Dashboard/CreateMode.dart';
import 'package:insoft_online_support/screens/Dashboard/Dashboard_done.dart';
import 'package:insoft_online_support/screens/Dashboard/FeedbackList.dart';
import 'package:insoft_online_support/screens/Dashboard/bunnerhome.dart';
import 'package:insoft_online_support/screens/Dashboard/theme_service.dart';
import 'package:insoft_online_support/screens/Dashboard/widget/List_Task.dart';
import 'package:insoft_online_support/screens/Dashboard/widget/Slider_Task.dart';
import 'package:insoft_online_support/screens/Dashboard/widget/flutter_switch.dart';
import 'package:insoft_online_support/screens/home%20page/home_page.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/screens/Dashboard/FeedbackList.dart';
import 'package:insoft_online_support/theme/theme.dart';
import 'package:insoft_online_support/theme/theme_colors.dart';
import 'package:insoft_online_support/models/feedback.dart' as fb;
import 'package:toggle_switch/toggle_switch.dart';

import '../../utils/clients/client.dart';
import '../../utils/providers/feedback_provider.dart';
import '../Task/Task.dart';

bool mode = true;


 int? count;

class Dashboard extends StatefulWidget {
  const Dashboard({String? num}) ;

  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {

  final LocalStorage storage = new LocalStorage('todo_app');

  late String? g='pppppppp';
  late PageController pageController;
  @override
late List<String> data;

  void initState() {
    String md='';
  //  feedbackMap=feedbacks.infoShowToJson();
    pageController = PageController(initialPage: 1, viewportFraction: 0.75);
    // TODO: implement initState
 //   getmode(mode);
    //CreateMode.createmode(appbar, continer, txt, bk, mywhite);
removeperf();

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

    // if(
    //
    // storage.getItem('todos').toString()=="lightmode"
    //
    // )
    //
    // {mode=true;}
    // else
    // {mode=false;}
     Color appbar;
    Color continer;
    Color bkcotinner;
    Color txt;
    Color bk;
    Color mywhite;
     Color sh;
    if (mode) {
      appbar = bluLayerzero;
      continer = bluLayerfive;
      txt = bluLayerfive;
      bkcotinner=bluLayerzero;
      mywhite = Colors.white;
      sh=Colors.black12;

      bk = bluLayerfive;
    }
    else {
      appbar = Colors.black;
      continer = Colors.white;
      txt = Colors.white;
      bkcotinner=Colors.black;
      bk = Colors.black;
      sh=Colors.white;
      mywhite = Colors.black;
    }



    const moonIcon = CupertinoIcons.moon_stars;
return Scaffold(
      backgroundColor:

 mywhite,
      appBar: AppBar(

          title: Text("Dashboard",style: TextStyle(color: txt),),
          backgroundColor: appbar,
          actions: [

            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(Icons.update,size: 25,color:txt,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(icon: Icon(Icons.settings),color:txt, onPressed: () {
                      msg(context,mywhite,txt);
                    },),
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
          ]




      ),


  body: Container(
    color: mywhite,
    child: Column(

      children: [
        Container(
          width: double.infinity,
          height: 220,
         color: mywhite,
          child: BunnerTop(txt:Colors.white,bk:bk,),
        ),
        Container(
          color: mywhite,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text("Tasks" ,style: TextStyle(fontFamily:MyThemes.CariofontFamily,fontSize: 15,color: txt,fontWeight: FontWeight.w500),),
                    Text("Assigned" ,style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500),),
                    Text("to me" ,style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500),),



                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  color: bluLayerfive,
                  height: 100,
                  width: 3,
                ),
              ),



              Positioned(
                  right: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Slider_Task(bk: mywhite,txt: txt,)

                  ),
                ),
              ),





          ],
          ),
        ),

        Container(
          color: Colors.transparent,
          width: double.infinity,
            height: MediaQuery.of(context).size.height-450,

          child:
          MyHomePage(bk: mywhite,txt: txt,sh: sh,)
        )


      ],
    ),
  ),
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
//done_number
getmode(String  mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
 //mode=bool.hasEnvironment( sharedPreferences.get("mode").toString());
  String shared=sharedPreferences.get("mode").toString();
  if(shared!=null)
    mode='xxxxxxx';
  else
    mode='';
 print(mode);

}
get_done_number()async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //mode=bool.hasEnvironment( sharedPreferences.get("mode").toString());
 String done_number=sharedPreferences.get("done_number").toString();
  print("ppppppppppppppppppp="+done_number);
  return done_number;

}





savperf(String mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("mode", mode);
  print(sharedPreferences.get("mode"));

}

Future<void> msg(BuildContext context,Color txt,Color BK) async {
  return showDialog
  <void>(
    context: context,
    barrierDismissible: false, // user must t\\ap button!
    builder: (BuildContext context) {
      return AlertDialog(
        //title: const Icon(Icons.error,color: Colors.red,),
        content:  Column(
          children: [

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text("Appearance",style: TextStyle(color: txt,fontSize: 25),),
),
            AnimatedToggle(values: ['Dark','Light'], backgroundColor: txt, buttonColor: txt, textColor: Colors.white)


          ],
        )
      );

    },
  );
}

removeperf()async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  preferences.remove("mode");

}
Future<String>
done_number
    (String h)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
String d=  sharedPreferences.setString("done_number", h).toString();
  print("done_number========="+sharedPreferences.get("done_number").toString());
return d;
}

class ScrollSizingWidget extends StatefulWidget {
  const ScrollSizingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ScrollSizingWidget> createState() => _ScrollSizingWidgetState();
}

class _ScrollSizingWidgetState extends State<ScrollSizingWidget> {
  final ScrollController _horizontal = ScrollController();
  final ScrollController _vertical = ScrollController();

  @override
  void dispose() {
    _horizontal.dispose();
    _vertical.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(

      controller: _vertical,
      notificationPredicate: (notification) => notification.depth == 1,
      child: Scrollbar(
        controller: _horizontal,
        scrollbarOrientation: ScrollbarOrientation.bottom,
        child: SingleChildScrollView(
          controller: _horizontal,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
              height: 50,
              width: 100,
              child: Column(
                  children:[
                    Container(width: 100, height: 200, color: Colors.green),
                    Flexible(
                        child: SingleChildScrollView(
                            controller: _vertical,
                            child: Container(
                              height: 70,
                              width: 100,
                              color: Colors.yellow,
                            )
                        )
                    ),

                  ]
              )
          ),

        ),
      ),
    );
  }
}