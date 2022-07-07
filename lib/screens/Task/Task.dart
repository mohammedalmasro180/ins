import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/main.dart';
import 'package:insoft_online_support/screens/Dashboard/listest.dart';
import 'package:insoft_online_support/screens/Dashboard/widget/myappbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/theme.dart';
import '../../theme/theme_colors.dart';
class Task extends StatefulWidget {
  final String name;
  final String status;
  final String type;
  final String description;
  final String time;
  const Task({Key? key,required this.name,required this.status,required this.time,required this.type,required this.description}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}
bool mode=true;

class _TaskState extends State<Task> {
  String md='';


  late PageController pageController;
  @override

  void initState() {
    pageController = PageController(initialPage: 1, viewportFraction: 0.75);
    // TODO: implement initState



    super.initState();
  }
  @override
  void dispose() {
    //_pageController.dispose();

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Color appbar;
    Color continer;
    Color txt;
    Color bk;
    Color mywhite;
    if(mode)
    {
      appbar=bluLayerzero;
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
      backgroundColor: mywhite,
      appBar:      AppBar(

          title: Text("Task",style: TextStyle(color: txt),),
          backgroundColor: appbar,
          actions: [

            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(Icons.update,size: 25,color:txt,),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: IconButton(icon: Icon(Icons.settings),color:txt, onPressed: () {
                  //     modech(context,txt,bk);
                  //   },),
                  // ),

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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

        Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Text("Info:",style: TextStyle(fontSize: 30,color: txt,fontWeight: FontWeight.w700),),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
Expanded(child: Column(

  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 textDirection:TextDirection.ltr,
      children: [

        Text("Customer: " ,style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
        Text(widget.name ,style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500,letterSpacing: 0.5),),

      ],
    ),

    Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      //                 textDirection:TextDirection.ltr,
      children: [

        Text("Status: " ,style: TextStyle(
              fontSize: 15,color: txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
        Text(widget.status.toString(),style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500,letterSpacing: 0),),

      ],
    ),

  ],
)),
                Expanded(child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      //                 textDirection:TextDirection.ltr,
                      children: [

                        Text("Type: " ,style: TextStyle(fontSize: 15,color:txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                        Text( widget.type, style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                      ],
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      //                 textDirection:TextDirection.ltr,
                      children: [

                        Text("Time: " ,style: TextStyle(fontSize: 15,
                            color: txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                        Text(
                          widget.time
                          ,
                          style: TextStyle(fontSize: 15,color: txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                      ],
                    ),

                  ],
                ))
              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Description:",style: TextStyle(fontSize: 30,color: txt,fontWeight: FontWeight.w700),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Images:",style: TextStyle(fontSize: 30,color: txt,fontWeight: FontWeight.w700),),
          ),



Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Slider(bk: bk, txt: txt),
),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Customer Info:",style: TextStyle(fontSize: 30,color: txt,fontWeight: FontWeight.w700),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                border: Border.all(color: txt)
              ),
              width: double.infinity,

              child:test_list(txt: txt,bk: mywhite,),
            ),
          ),







//SizedBox(height: MediaQuery.of(context).size.height-950,),
    Align(
      alignment: Alignment.bottomRight,
      child: Container(
      padding: EdgeInsets.only(bottom: 22.0),

      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: MaterialButton(onPressed: (){
            msg(context,txt,txt);
          },
          color: txt,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Change Status",style: TextStyle(color: mywhite,fontSize: 20),),
          ),),
        )
      ],
      ),
      ),
    ),

        ],
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
      Padding(
        padding: const EdgeInsets.all(1.0),
        child:
        CarouselSlider(
          options: CarouselOptions(height: 100.0),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.shade100
                    ),
                    child: Text('Image $i', style:
                    TextStyle(fontSize: 16.0,color: widget.txt),)
                );
              },
            );
          }).toList(),
        )




      );





  }
}

 Future<void> msg(BuildContext context,Color txt,Color bk) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must t\\ap button!
    builder: (BuildContext context) {
      return
        AlertDialog(
          content: StatefulBuilder(  // You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        return
          SingleChildScrollView(
            child: MyStatefulWidget(bk: bk,txt: txt,)

          );
          }
          )
        );
          },
  );
}

Future<void> modech(BuildContext context,Color txt,Color bk) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must t\\ap button!
    builder: (BuildContext context) {
      return AlertDialog(
        //title: const Icon(Icons.error,color: Colors.red,),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: MaterialButton(
                  color: bk,
                  onPressed: () {

                  },
                  child: Text("Drak",style: TextStyle(color: Colors.white),),),

              ),
              Center(
                child: MaterialButton(
                  color: bk,
                  onPressed: () {

                  },
                  child: Text("Light",style: TextStyle(color:Colors.white),),),

              ),
            ],
          ),
        ),

      );
    },
  );
}

getmode(bool   mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //mode=bool.hasEnvironment( sharedPreferences.get("mode").toString());
  mode=sharedPreferences.get("mode").toString().parseBool();
  print(mode);

}
extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {

  final Color bk;
  final Color txt;
  const MyStatefulWidget({Key? key ,required this.bk,required this.txt}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Set Status As",
            style: TextStyle(fontSize: 25,color: widget.txt),
          ),
        ),
        ListTile(
          title:  Text('Not Assigned',

            style: TextStyle(fontSize: 15,color: widget.txt),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Assign to me',
            style: TextStyle(fontSize: 15,color: widget.txt),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),

        ListTile(
          title:Text('Done',
            style: TextStyle(fontSize: 15,color: widget.txt),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),

        Center(
          child: MaterialButton(
            color: widget.bk,
            onPressed: () {

            },
            child: Text("Save",
    style: TextStyle(fontSize: 15,color: Colors.white),),),

        ),

        Center(
          child: MaterialButton(
            color: widget.bk,
            onPressed: () {

            },
            child: Text("Cancel",
              style: TextStyle(fontSize: 15,color: Colors.white),),),

        ),
      ],
    );
  }
}
