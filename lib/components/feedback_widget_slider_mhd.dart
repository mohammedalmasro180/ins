import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/models/customer.dart';
import 'package:insoft_online_support/models/feedback.dart' as fd;
import 'package:insoft_online_support/screens/feedback/feedback_page.dart';
import 'package:insoft_online_support/theme/theme.dart';
import 'package:insoft_online_support/theme/theme_colors.dart';
import 'package:insoft_online_support/utils/providers/feedback_provider.dart';
import 'package:provider/provider.dart';

import '../models/enums/feedback_enums.dart';
import '../utils/colors.dart';

class FeedBackWidgetmhdSlider extends StatefulWidget {
  final fd.Feedback feedback;
  final bool isOpen;
  const FeedBackWidgetmhdSlider({
    Key? key,
    required this.feedback, this.isOpen=false,
  }) : super(key: key);

  @override
  State<FeedBackWidgetmhdSlider> createState() => _FeedBackWidgetmhdSliderState();
}

class _FeedBackWidgetmhdSliderState extends State<FeedBackWidgetmhdSlider> {
  late Map<String, dynamic> feedbackMap;
  late Customer customer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    feedbackMap = widget.feedback.infoShowToJson();
    customer = Customer.firstFromJson(widget.feedback.infoShowToJson()['customer']);
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        if(!widget.isOpen) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => FeedBackPAge(
                    feedback: widget.feedback,
                  )));
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width:  MediaQuery.of(context).size.width-150,
              margin: const EdgeInsets.all(10),
              decoration: MyThemes.cardDecoration(context),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 9,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadiusDirectional.only(

                              ),
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),

                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
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

                      Text("Customer: " ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
                      Text("C_Name " ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0.5),),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    //                 textDirection:TextDirection.ltr,
                    children: [

                      Text("Status: " ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),
                      Text("R_Status" ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    //                 textDirection:TextDirection.ltr,
                    children: [

                      Text("Type: " ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),
                      Text("R_Type" ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    //                 textDirection:TextDirection.ltr,
                    children: [

                      Text("Time: " ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),
                      Text("R_Time" ,style: TextStyle(fontSize: 20,color: bluLayerfive,fontWeight: FontWeight.w500,letterSpacing: 0),),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
