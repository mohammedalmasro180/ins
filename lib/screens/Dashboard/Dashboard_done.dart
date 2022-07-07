import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/theme_colors.dart';
import '../../utils/clients/client.dart';
import '../Task/Task.dart';
class dashbpard_done extends StatefulWidget {


  final Color bk;
  final Color txt;

  const dashbpard_done({Key? key,required this.txt,required this.bk}) : super(key: key);

  @override
  _dashbpard_doneState createState() => _dashbpard_doneState();
}

class _dashbpard_doneState extends State<dashbpard_done> {
  @override
  Widget build(BuildContext context) {
  //  widget.i=9;
    int u=9;
    done_number('9');

    return
      FutureBuilder(
          future: Client.mhdgetFeedbacks(),
          builder:(BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return

                ListView.builder(

                    itemCount:
                    snapshot.data.length,

                    itemBuilder: (context,i) {
                   //   i.bitLength.toString();

                      if(               snapshot.data[i]['status'].toString()=='DONE'
                      )
                        return
                          InkWell(
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
                              width:  MediaQuery.of(context).size.width-15,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: widget.bk,
                                boxShadow:
                                <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      spreadRadius: 5,
                                      offset: Offset(0.75, 0.75)
                                  ),
                                ],

                              ),


                              //               decoration: MyThemes.cardDecoration(context),
                              child: Row(
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 9,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            boxShadow:
                                            <BoxShadow>[
                                              BoxShadow(
                                                  color: mygray,
                                                  blurRadius: 150.0,
                                                  offset: Offset(0.0, 0.75)
                                              ),
                                            ],
                                            borderRadius: const BorderRadiusDirectional.only(

                                            ),
                                            //     color: Colors.deepOrange,
                                          ),
                                        ),
                                      ),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(

                                              color:
                                              snapshot.data[i]['status'].toString()=='Assigned'
                                                  ?myyallow:
                                              snapshot.data[i]['status'].toString()=='DONE'
                                                  ?mygreen:
                                              snapshot.data[i]['status'].toString()=='Not Assigned'
                                                  ?myred:



                                              myred,


                                              borderRadius:BorderRadius.circular(10)
                                          ),
                                          child:
                                          snapshot.data[i]['type'].toString()=='BUGS'?
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset("assets/images/bug w.png",width: 55,height: 55,),
                                          )
                                              : snapshot.data[i]['type'].toString()=='Warning'?
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset("assets/images/war w.png",width: 55,height: 55,),
                                          ) :
                                          snapshot.data[i]['type'].toString()=='Erorr'?
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset("assets/images/err w.png",width: 55,height: 55,),
                                          )
                                              :
                                          Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: SizedBox()
                                          )


                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                      Column(
                                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            //                 textDirection:TextDirection.ltr,
                                            children: [

                                              Text("Customer: " ,style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
                                              Text(    snapshot.data[i]['customer']['name'].toString()
                                                ,style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
                                            ],
                                          ),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            //                 textDirection:TextDirection.ltr,
                                            children: [

                                              Text("Status: " ,style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                              Text(snapshot.data[i]['status'].toString(),
                                                style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                            ],
                                          ),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            //                 textDirection:TextDirection.ltr,
                                            children: [

                                              Text("Type: " ,style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                              Text( snapshot.data[i]['type'].toString(), style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                            ],
                                          ),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            //                 textDirection:TextDirection.ltr,
                                            children: [

                                              Text("Time: " ,style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                              Text(
                                                snapshot.data[i]['review_at'].toString(),
                                                style: TextStyle(fontSize: 15,color:  widget.txt,fontWeight: FontWeight.w500,letterSpacing: 0),),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          );

                      else
                        return SizedBox();


                    }
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
                  child: Text("Assigned",style: TextStyle(color: Colors.white),),),

              ),
              Center(
                child: MaterialButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () {

                  },
                  child: Text("Done",style: TextStyle(color: Colors.white),),),

              ),
            ],
          ),
        ),

      );
    },
  );
}

done_number
    (String done_number)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("done_number", done_number);
  print("done_number========="+sharedPreferences.get("done_number").toString());

}
