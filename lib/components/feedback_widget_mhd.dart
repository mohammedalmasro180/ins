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

class FeedBackWidgetmhd extends StatefulWidget {
  final fd.Feedback feedback;
  final bool isOpen;
  const FeedBackWidgetmhd({
    Key? key,
    required this.feedback, this.isOpen=false,
  }) : super(key: key);

  @override
  State<FeedBackWidgetmhd> createState() => _FeedBackWidgetmhdState();
}

class _FeedBackWidgetmhdState extends State<FeedBackWidgetmhd> {
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
      child:

      Container(
        width:  MediaQuery.of(context).size.width-15,
        margin: const EdgeInsets.all(10),
        decoration: MyThemes.cardDecoration(context),
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
                      //     color: Colors.deepOrange,
                    ),
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 220),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: widget.feedback.status ==
                          feedbackStatusValue[FeedbackStatus.done]
                          ? Colors.green
                          : widget.feedback.status ==
                          feedbackStatusValue[FeedbackStatus.assigned]
                          ?Colors.red[900]: MyColors().yellow,

                      borderRadius:BorderRadius.circular(10)
                  ),
                  child: Icon(
                   widget.feedback.status==
                       feedbackStatusValue[FeedbackStatus.assigned]?
                       Icons.bug_report_outlined:
                   Icons.warning,


                    color: Colors.white,size:60 ,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      feedbackMap.keys.length,
                          (index) => feedbackMap.values.elementAt(index) == null
                          ? const SizedBox()
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            feedbackMap.keys.elementAt(index) + ": ",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1,
                          ),
                          if (feedbackMap.keys
                              .elementAt(index)
                              .toLowerCase() !=
                              "customer")

                            SizedBox(
                              width:MediaQuery.of(context).size.width-200 ,
                              child: Text(
                                //0---------0
                                feedbackMap.values.elementAt(index),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1,
                              ),
                            ),
                          if (feedbackMap.keys
                              .elementAt(index)
                              .toLowerCase() ==
                              "customer")
                            Text(
                              customer.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1,
                            ),
                        ],
                      )),
                ),

              ),
            ]),
      )


    );
  }
}
