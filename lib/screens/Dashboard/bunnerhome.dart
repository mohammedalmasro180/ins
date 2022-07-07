import 'dart:math';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:insoft_online_support/components/feedback_widget_mhd.dart';
import 'package:insoft_online_support/components/feedback_widget_slider.dart';
import 'package:insoft_online_support/models/customer.dart';
import 'package:insoft_online_support/models/enums/feedback_enums.dart';
import 'package:insoft_online_support/models/feedback.dart' as fb;
import 'package:insoft_online_support/theme/theme.dart';
import 'package:insoft_online_support/theme/theme_colors.dart';
import 'package:insoft_online_support/utils/providers/feedback_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/appbar.dart';
import '../../components/feedback_widget.dart';
import '../../components/percent_indicator.dart';
import '../../utils/clients/data.dart';
import '../../utils/providers/customers_provider.dart';

class BunnerTop extends StatefulWidget {
  final Color bk;

  final Color txt;


  const BunnerTop({Key? key,required this.txt,required this.bk}) : super(key: key);

  @override
  State<BunnerTop> createState() => _BunnerTopState();
}

class _BunnerTopState extends State<BunnerTop>
    with SingleTickerProviderStateMixin {
  final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();
  late AnimationController _animationController;
  late bool isOpen;
  late int currentFb;
  List<fb.Feedback> feedbacks = [];
  @override
  Widget build(BuildContext context) {
    //feedbacks = Provider.of<FeedbacksProvider>(context).reviewingFeedbacks;
    /*if (loadFromServer) {
      feedbacks = Provider.of<FeedbacksProvider>(context).feedbacks;
    }*/
    _size = MediaQuery.of(context).size;
    return     Scaffold
      (
backgroundColor: Colors.transparent,
      body: SmartRefresher(
        enablePullDown: true,
        header: WaterDropMaterialHeader(

        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load".tr());
            } else if (mode == LoadStatus.loading) {
              body = const CircularProgressIndicator.adaptive();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!".tr());
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more".tr());
            } else {
              body = Text("No more Data".tr());
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshControllerPage,
        onRefresh: _onRefresh,
        child: Column(

          children: [
            SizedBox(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 220,

                        width: MediaQuery.of(context).size.width-60,

                        decoration: BoxDecoration(
                          color:widget.bk,
                          boxShadow:
                          <BoxShadow>[
                            BoxShadow(
                                color: bluLayerzero,
                                blurRadius: 25.0,
                                spreadRadius: 10,
                                offset: Offset(0.75, 0.75)
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text("Today`s New Reports:"+"   "+Provider.of<FeedbacksProvider>(context).feedbacks
                              .length.toString(),

                                style:
                                TextStyle(color: widget.txt,fontSize: 25),),
                              Text("Today`s Assi Reports:"+"   "+     Provider.of<FeedbacksProvider>(context).feedbacks
                                  .length.toString(),

                                style: TextStyle(color: widget.txt,fontSize: 25),),
                              Text("Today`s Done Reports:"+"   "+
                                  Provider.of<FeedbacksProvider>(context).feedbacks
                                  .length.toString(),

                                style: TextStyle(color: widget.txt,fontSize: 25),),


                            ],
                          ),
                        ),),
                    ),
                    // const PercentIndicator(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
  late PageController _pageController;
  late RefreshController _refreshControllerPage;
  late Size _size;
  late bool loadFromServer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFromServer = false;
    _refreshControllerPage = RefreshController(initialRefresh: true);
    currentFb = 1;

    isOpen = false;
    _pageController = PageController(initialPage: 1, viewportFraction: 0.75);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _zoomDrawerController.stateNotifier!.addListener(() {
        var state = _zoomDrawerController.isOpen!.call();
        if (isOpen != state) {
          _handleOnPressed();
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
    _pageController.dispose();
    _refreshControllerPage.dispose();

  }

  Future<void> _onRefresh() async {
    var result = await Provider.of<FeedbacksProvider>(context, listen: false)
        .initFeedbacks();
    if (result) {
      loadFromServer = true;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("There is no data".tr()),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    }
    _refreshControllerPage.refreshCompleted();
  }

  void _handleOnPressed() {
    setState(() {
      isOpen = !isOpen;
      isOpen ? _animationController.forward() : _animationController.reverse();
    });
  }
}
