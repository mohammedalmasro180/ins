import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/clients/data.dart';


class MyAppbar extends StatefulWidget {
  final String  title;
  final Widget? leading;
  final double? height;
  final bool automaticallyImplyLeading;
   const MyAppbar({
    Key? key, this.title='', this.leading,
    this.automaticallyImplyLeading=false, this.height}) : super(key: key);

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  double positioned=2000;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      positioned=0.0;
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          AnimatedPositioned(
            right: positioned,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: widget.height??AppBar().preferredSize.height,
              child:AppBar(
                title: Text(widget.title),
                systemOverlayStyle: (themeMode.brightness
                    ==Brightness.dark)?
                SystemUiOverlayStyle.light:SystemUiOverlayStyle.light,
                automaticallyImplyLeading: widget.automaticallyImplyLeading,
                leading: widget.leading??const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
