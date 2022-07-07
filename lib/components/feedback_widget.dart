import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/models/customer.dart';
import 'package:insoft_online_support/models/feedback.dart' as fd;
import 'package:insoft_online_support/screens/feedback/feedback_page.dart';
import 'package:insoft_online_support/theme/theme.dart';
import 'package:insoft_online_support/utils/providers/feedback_provider.dart';
import 'package:provider/provider.dart';

import '../models/enums/feedback_enums.dart';
import '../utils/colors.dart';

class FeedBackWidget extends StatefulWidget {
  final
  fd.Feedback feedback;
  final bool isOpen;
  const FeedBackWidget({
    Key? key,
    required this.feedback, this.isOpen=false,
  }) : super(key: key);

  @override
  State<FeedBackWidget> createState() => _FeedBackWidgetState();
}

class _FeedBackWidgetState extends State<FeedBackWidget> {
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
    return
      GestureDetector(
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
        margin: const EdgeInsets.all(20),
        decoration: MyThemes.cardDecoration(context),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Center(
                child: Container(
                  width: 8,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(20),
                      bottomEnd: Radius.circular(20),
                    ),
                    color: widget.feedback.status ==feedbackStatusValue[FeedbackStatus.done]? Colors.green
                        : widget.feedback.status ==
                                feedbackStatusValue[FeedbackStatus.assigned]
                            ?Colors.red[900]: MyColors().yellow,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
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

                                    feedbackStatusValue[FeedbackStatus]!.length.toString()),


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
            ],
          ),
        ),
      ),

    );
  }
}
