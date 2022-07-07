import 'package:flutter/material.dart';
import 'package:insoft_online_support/main.dart';
import 'package:insoft_online_support/utils/clients/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
class myappbar extends StatefulWidget {
  final Color BK;
  final Color txt;
final String address;
  const myappbar({Key? key,required this.txt,required this.BK,required this.address}) : super(key: key);

  @override
  _myappbarState createState() => _myappbarState();
}
bool mode=true;

class _myappbarState extends State<myappbar> {
  @override

  Widget build(BuildContext context) {

    return
      AppBar(

        title: Text(widget.address,style: TextStyle(color: widget.txt),),
        backgroundColor: widget.BK,
        actions: [

          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.update,size: 25,color:widget.txt,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.settings),color:widget.txt, onPressed: () {
                    msg(context,widget.txt,Colors.white);
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




      );
  }
}

saveperf(String mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("mode", mode);
  print(sharedPreferences.get("mode"));

}


getmode(String  mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //mode=bool.hasEnvironment( sharedPreferences.get("mode").toString());
  String shared=sharedPreferences.get("mode").toString();
  if(shared==null)
    mode='xxxxxxx';
  else
    mode='';
  print(mode);

}
savperf(String mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("mode", mode);
  print(sharedPreferences.get("mode"));

}



// ignore: non_constant_identifier_names
Future<void> msg(BuildContext context,Color txt,Color BK) async {
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
                  color: Colors.lightBlueAccent,
                  onPressed: () {
mode=true;
                  },
                  child: Text("Light",style: TextStyle(color: Colors.white),),),

              ),
              Center(
                child: MaterialButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () {

      mode=false;            },
                  child: Text("Dark",style: TextStyle(color: Colors.white),),),

              ),
            ],
          ),
        ),

      );
    },
  );
}

removeperf()async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  preferences.remove("mode");

}