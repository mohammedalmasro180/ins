import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/components/feedback_widget.dart';
import 'package:insoft_online_support/models/customer.dart';
import 'package:provider/provider.dart';

import '../../models/enums/feedback_enums.dart';
import '../../models/feedback.dart' as fb;
import '../../utils/colors.dart';
import '../../utils/providers/feedback_provider.dart';

class FeedBackPAge extends StatefulWidget {
  final fb.Feedback feedback;
  const FeedBackPAge({Key? key, required this.feedback,}) : super(key: key);

  @override
  State<FeedBackPAge> createState() => _FeedBackPAgeState();
}

class _FeedBackPAgeState extends State<FeedBackPAge> with SingleTickerProviderStateMixin{
  late Customer _customer;
  late fb.Feedback _feedback;
  late List<String> customerTab;
  late TabController _tabController;
  late Size _size;
  late bool loading;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading=false;

    _feedback=widget.feedback;
    customerTab=['address','mobileAccount','odooAccount'];
    _tabController=TabController(length: customerTab.length, vsync: this);
  }
  @override
  dispose(){
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _size =MediaQuery.of(context).size;
    loading=Provider.of<FeedbacksProvider>(context).loading;
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: ElevatedButton(
            style:  ElevatedButton.styleFrom(
              primary: _feedback.status==feedbackStatusValue[FeedbackStatus.done]?Colors.green:
              _feedback.status==feedbackStatusValue[FeedbackStatus.assigned]?MyColors().yellow:
              null
            ),
            onPressed: () async {
             var result= await showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height-225,
                      0,100),
              items:List.generate(FeedbackStatus.values.length, (index) => PopupMenuItem(
                value: FeedbackStatus.values[index],
                child: Text(
              feedbackStatusValue.values.elementAt(index),
                  style: Theme.of(context).textTheme.subtitle1,
              ),)));
             if(result!=null){
              await Provider.of<FeedbacksProvider>(
                   context,
                   listen: false).updateFeedbackStatus(result, _feedback.id??'-1');
               setState(() {});
             }
            },
            child: Text(_feedback.status),
          ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: IconButton(
                        padding: const EdgeInsets.all(5),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(CupertinoIcons.back,color: Theme.of(context).primaryColor,size: 40))
                    ),
                    Center(child: FeedBackWidget(feedback:_feedback,isOpen: true,)),
                     TabBar(
                       labelPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                         controller: _tabController,
                         isScrollable: true,
                         tabs: List.generate(customerTab.length,
                                 (index) => Text(customerTab[index].tr()))),
                    SizedBox(
                      height: _size.height*.6,
                      child: TabBarView(
                        controller: _tabController,
                          children: List.generate(customerTab.length, (index) {
                          try{
                            Map<String,dynamic> customerInfo
                            =_customer.showInfoToJson()[customerTab[index]];
                            return SingleChildScrollView(
                            child: Column(
                              children: List.generate(customerInfo.keys.length
                                  , (index) =>  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(customerInfo.keys.elementAt(index)+": ",style: Theme.of(context).textTheme.subtitle1,)
                                          ,Text(customerInfo.values.elementAt(index).toString(),style: Theme.of(context).textTheme.subtitle2,)
                                        ],
                                      ),
                                      const Divider(indent: 50,endIndent: 50,thickness: 1,height: 20),
                                    ],
                                  )),
                            ),
                          );
                          }catch(e){
                            return Center(child: Text("There is no data".tr(),style: Theme.of(context).textTheme.caption,));
                          }
                          }
                          )
                      ),
                    )

                  ],
                ),
              ),
            )),
        Visibility(
            visible: loading,
            child: Container(
              color: Colors.black.withOpacity(0.1),
          width: _size.width,
          height: _size.height,
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ))
      ],
    );
  }
}
