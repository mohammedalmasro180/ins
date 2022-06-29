import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  final double radius,percent,lineWidth,backgroundWidth;
  const PercentIndicator({
    Key? key,
    this.radius=40.0, this.percent=.7, this.lineWidth=10,
    this.backgroundWidth=15}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircularPercentIndicator(
      radius:radius,
      backgroundColor: Colors.green,
      percent: percent,
      lineWidth: lineWidth,
      backgroundWidth: 10.0,
      fillColor: Colors.transparent,
      restartAnimation: true,
      progressColor: Colors.green,
      startAngle: 0.0,
      widgetIndicator: Icon(Icons.circle,size: 50,),
      circularStrokeCap: CircularStrokeCap.round,
      arcBackgroundColor: Colors.green.shade100,
      arcType: ArcType.FULL,
      center: Text((percent*100).toInt().toString()+"%"),
    );
  }
}
