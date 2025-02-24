import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdUiTabBar extends StatefulWidget {
  final List<String> buttons;
  final List<Widget> tapView;
  final ValueChanged<int>? onTap;
  final int initialIndex;
  const BdUiTabBar({super.key,
    required this.buttons,
    required this.tapView,
    required this.initialIndex,
    this.onTap,
  });

  @override
  State<BdUiTabBar> createState() => _BdUiTabBarState();
}

class _BdUiTabBarState extends State<BdUiTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
        initialIndex: widget.initialIndex,
        length: widget.buttons.length, vsync: this, animationDuration: Duration.zero);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.sizedAppbar,
          child: TabBar(
            onTap: widget.onTap,
            controller: _tabController,
            labelPadding: EdgeInsets.symmetric(horizontal: size.sizedBox14),
            padding: EdgeInsets.symmetric(horizontal: size.sizedBox8),
            indicatorPadding: EdgeInsets.symmetric(horizontal: size.sizedBox7_5),
            isScrollable: true,
            labelColor: bananaBack,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: size.sizedBox17, color: blackWrite, fontWeight: FontWeight.w600),
            unselectedLabelStyle:  TextStyle(fontSize: size.sizedBox17, color: blackWrite, fontWeight: FontWeight.w400),
            unselectedLabelColor: Colors.grey.shade500,
            indicatorColor: bananaBack,
            // dividerColor: Colors.yellow,
            // dividerHeight: WidgetSize(context).sizedBox2,
            tabs:  <Widget>[
              ...List.generate(
                widget.buttons.length,
                    (index) =>
                    Tab(text: widget.buttons[index],
                    ),
              ).toList()
            ],
          ),
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              ...List.generate(widget.buttons.length, (index) =>
              widget.tapView[index],
              )
            ],
          ),
        ),
      ],
    );
  }
}
