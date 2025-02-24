import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/components/text_class/timer_text.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../components/stop_watch_timer.dart';
import '../../../../../../../../css/size.dart';
import '../../../../../../../../css/style.dart';
import '../../../../views/widgets/custom_progress_indicator.dart';
import '../../estimate_controller.dart';



class CountDownTimerPage extends StatefulWidget {
  final presetMilliseconds1;
  const CountDownTimerPage({
    required this.presetMilliseconds1,
    Key? key}) : super(key: key);


  @override
  State<CountDownTimerPage> createState() => CountDownTimerPageState();
}

class CountDownTimerPageState extends State<CountDownTimerPage> {

  final _isHours = true;
  late final StopWatchTimer _stopWatchTimer;


  @override
  void initState(){
    super.initState();
    final first = 1000*60*60*24*2;
    final now = DateTimeConfig().now;
    final date = DateTime.parse(widget.presetMilliseconds1).toLocal();
    final difference = now.difference(date).inMilliseconds;
    final end = first-difference;
    _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: end,
      onStopped: () {},
      onEnded: () {},
    );

    _stopWatchTimer.onStartTimer();
  }



  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stopWatchTimer.rawTime,
      initialData: _stopWatchTimer.rawTime.value,
      builder: (context, snap) {
        final value = snap.data!;
        final String displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours, milliSecond: false);
        List<String> display = displayTime.split(':');
        // final TextStyle style1 = TextStyle(
        //     fontSize:  WidgetSize(context).sizedBox20,
        //     color: Style.blackWrite,
        //     fontWeight: FontWeight.w600
        // );
        // final TextStyle style2 = TextStyle(
        //     fontSize:  WidgetSize(context).sizedBox18,
        //     color: Style.blackWrite,
        //     fontWeight: FontWeight.w600
        // );
        return TimerText(display: display,);

                },
              );
  }
}


