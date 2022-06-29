import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class myappbar extends StatefulWidget {
  final Color BK;
  final Color txt;
  const myappbar({Key? key,required this.txt,required this.BK}) : super(key: key);

  @override
  _myappbarState createState() => _myappbarState();
}
bool mode=true;

class _myappbarState extends State<myappbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: Text("Dashboard",style: TextStyle(color: widget.txt),),
      backgroundColor: widget.BK,
      actions: [
        Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.update,size: 25,color: widget.txt,),
              ),
              InkWell(
                onTap: (){msg(context);},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.settings,size: 25,color: widget.txt,),
                ),
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
    );
  }
}

saveperf(String mode)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("mode", mode);
  print(sharedPreferences.get("mode"));

}

Future<void> msg(BuildContext context) async {
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

                  },
                  child: Text("Light",style: TextStyle(color: Colors.white),),),

              ),
              Center(
                child: MaterialButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () {

                  },
                  child: Text("Dark",style: TextStyle(color: Colors.white),),),

              ),
            ],
          ),
        ),

      );
    },
  );
}
