import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/helper/stop_watch_record.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/manager/estimate_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate_option/banana_estimate_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_step_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateBodyStatusBarView extends StatelessWidget {
  const EstimateBodyStatusBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BdLayoutPadding(
      padding: PaddingEnum.axis0516,
      child: BlocSelector<BananaEstimateOptionBloc, BananaEstimateOptionState, String>(
          selector: (state) => state.dStatus,
          builder: (context, dStatus) =>
          switch(dStatus){
            '진행중' =>  const _Timer(),
            _ => _Default(dStatus: dStatus,)
          }
      ),
    );
  }
}


class _Timer extends StatefulWidget {
  const _Timer();

  @override
  State<_Timer> createState() => _TimerState();
}

class _TimerState extends State<_Timer> {

  late final StopWatchTimer _stopWatchTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final String preset = context.read<EstimateManager>().myDeal.diRegdate;
    int first = 1000*60*60*24*2;
    final DateTime now = DateTimeConfig().now;
    final DateTime date = DateTime.parse(preset).toLocal();
    final int difference = now.difference(date).inMilliseconds;
    final int end = first-difference;

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
      builder: (context, snap){
        int? step = snap.data;
        String displayTime = StopWatchTimer.getDisplayTime(step!, hours: true, milliSecond: false);
        int first = 1000*60*60*24*2;
        return switch(snap.data){
          null => const SizedBox(),
          _ => _Indicator(
              totalSteps: first,
              currentStep: step,
              rounded: context.read<VerseConfig>().size.sizedBox100,
              display: '남은 시간 : $displayTime    ',
              alignment: Alignment.centerRight
          )
        };
      },
    );
  }
}


class _Default extends StatelessWidget {
  final String dStatus;
  const _Default({
    required this.dStatus,
  });

  @override
  Widget build(BuildContext context) {
    return _Indicator(
        totalSteps: 10,
        currentStep: 0,
        rounded: context.read<VerseConfig>().size.sizedBox100,
        display: switch(dStatus){
          '에러' => '잠시 후, 다시 시도해주세요.',
          '' => '',
          _ => '$dStatus된 딜입니다.'
        },
        alignment: Alignment.center
    );
  }
}



class _Indicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double rounded;
  final String display;
  final AlignmentGeometry alignment;
  const _Indicator({
    required this.totalSteps,
    required this.currentStep,
    required this.rounded,
    required this.display,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Stack(
      children: [
        BdStepProgressIndicator(
          totalSteps: totalSteps,
          currentStep: currentStep,
          padding: 0,
          unselectedColor: greyD9D9D9,
          selectedColor: yellow,
          size: size.sizedBox30,
          roundedEdges: Radius.circular(rounded),
        ),
        Positioned.fill(
            child: Align(
              alignment: alignment,
              child: Text(
                display,
                style: TextStyle(
                    color: ultimateGrey,
                    fontSize: size.special,
                    fontWeight: FontWeight.w400
                ),
              ),
            )
        )
      ],
    );
  }
}
