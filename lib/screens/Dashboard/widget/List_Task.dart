import 'package:flutter/material.dart';

import '../../../theme/theme_colors.dart';
import '../Dashboard_done.dart';
import '../FeedbackList.dart';
class MyHomePage extends StatefulWidget {
  final Color bk;
  final Color txt;

  final Color sh;

  const MyHomePage({Key? key,required this.bk,required this.txt,required this.sh}) : super(key: key);

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
          shape: Border.all(width: 2,color: widget.txt),
          backgroundColor: widget.bk,
          title:
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
        body: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Align(
          alignment: Alignment.center,
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FeedbackList(txt: widget.txt, bk: widget.bk,sh: widget.sh,),
                  ),

                  Unassigned(txt: widget.txt, bk: widget.bk),
                  dashbpard_done(txt: widget.txt, bk: widget.bk,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
