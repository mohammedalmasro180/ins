import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:insoft_online_support/models/customer.dart';

import '../../theme/theme_colors.dart';
class test_list extends StatefulWidget {
  final Color txt;
  final Color bk;
  const test_list({Key? key,required this.txt,required this.bk}) : super(key: key);

  @override
  _test_listState createState() => _test_listState();
}

class _test_listState extends State<test_list>with TickerProviderStateMixin  {
  late Customer _customer;
  late List<String> customerTab;
  late TabController _tabController;
late Size _size;
  @override
  void initState() {
  customerTab=['address','mobileAccount','odooAccount'];
  _tabController=TabController(length: customerTab.length, vsync: this);

  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return
      Column(
        children: [
          TabBar(

          labelStyle: TextStyle(color: Colors.black,fontSize: 15),
    //indicatorColor: Colors.deepOrange,
    unselectedLabelColor:widget.txt,

    labelColor: Colors.white,

    indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: bluLayerfive),
    labelPadding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              controller: _tabController,
              isScrollable: true,
              tabs: List.generate(customerTab.length,
                      (index) => Text(customerTab[index].tr()))),
          SizedBox(
            height: 300,
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
                    return Center(child: Text("There is no data".tr(),style:TextStyle(color: widget.txt)));
                  }
                }
                )
            ),
          )

        ],
      );
  }
}
