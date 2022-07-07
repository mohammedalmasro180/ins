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
import 'package:insoft_online_support/utils/providers/feedback_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/appbar.dart';
import '../../components/feedback_widget.dart';
import '../../components/percent_indicator.dart';
import '../../utils/clients/data.dart';
import '../../utils/providers/customers_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();
  late AnimationController _animationController;
  late bool isOpen;
  late int currentFb;
  List<fb.Feedback> feedbacks = [];
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

  @override
  Widget build(BuildContext context) {
    //feedbacks = Provider.of<FeedbacksProvider>(context).reviewingFeedbacks;
    /*if (loadFromServer) {
      feedbacks = Provider.of<FeedbacksProvider>(context).feedbacks;
    }*/
    _size = MediaQuery.of(context).size;
    return ZoomDrawer(
      drawerShadowsBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      controller: _zoomDrawerController,
      mainScreenTapClose: true,
      menuScreen: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: ThemeSwitcher(builder: (context) {
                    return IconButton(
                      icon: const Icon(CupertinoIcons.moon_stars),
                      onPressed: () async {
                        ThemeSwitcher.of(context).changeTheme(
                          theme: ThemeModelInheritedNotifier.of(context)
                                      .theme
                                      .brightness ==
                                  Brightness.light
                              ? MyThemes.darkTheme
                              : MyThemes.lightTheme,
                        );
                        themeMode =
                            ThemeModelInheritedNotifier.of(context).theme;
                      },
                    );
                  })),
              Positioned(
                  bottom: 10,
                  left: 40,
                  child:  PopupMenuButton(
                    itemBuilder: (BuildContext context) { return [
                       PopupMenuItem(
                        value: 1,
                        child: Text('English'.tr()),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('germany'.tr()),
                      ),
                    ];},
                    child: const Icon(CupertinoIcons.star),
                  )
                  ),
            ],
          ),
        ),
      ),
      mainScreen: Scaffold
        (
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            int number= 1 + Random().nextInt(49 - 1);
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text('$number'),
              content: Text('$number'),
            ));
          },
          child: const Icon(Icons.star),
        ),
        appBar: PreferredSize(
            preferredSize: Size(
                AppBar().preferredSize.width, AppBar().preferredSize.height),
            child: MyAppbar(
              height: 120,
              title: "Insoft Support".tr(),
              leading: IconButton(
                  onPressed: () {
                    _zoomDrawerController.toggle!.call();
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      size: 30,
                      progress: _animationController)),
            )),

        body: SmartRefresher(
          enablePullDown: true,
          header: WaterDropMaterialHeader(
            backgroundColor: Theme.of(context).primaryColor,
            color: Colors.white,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "problems assigned:".tr(),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(

                                    Provider.of<FeedbacksProvider>(context).feedbacks
                                        .length.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Problems reviewing:".tr(),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "50".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Problems done:".tr(),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "50".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        const PercentIndicator(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: _size.width,
                  height: 200,
                  child: PageView(
                    onPageChanged: (page) {
                      currentFb = page;
                      setState(() {});
                    },
                    controller: _pageController,
                    children: List.generate(
                        Provider.of<FeedbacksProvider>(context).reviewingFeedbacks.length,
                        (index) => FeedBackWidgetSlider(
                              feedback:
                              Provider.of<FeedbacksProvider>(context).reviewingFeedbacks.elementAt(index),
                            )),
                  ),
                ),
                Visibility(
                  visible:  Provider.of<FeedbacksProvider>(context).feedbacks.isNotEmpty,
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentFb,
                    onDotClicked: (index) {
                      currentFb = index;
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                      setState(() {});
                    },
                    count: Provider.of<FeedbacksProvider>(context).feedbacks
                        .length,
                    effect: SwapEffect(
                      type: SwapType.yRotation,
                      activeDotColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Wrap(
                  children: List.generate(
                      Provider.of<FeedbacksProvider>(context).feedbacks
                          .length,
                      (index) => FeedBackWidget(
                            feedback:  Provider.of<FeedbacksProvider>(context).feedbacks
                                .elementAt(index),
                          )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      menuBackgroundColor: Colors.white12,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
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
