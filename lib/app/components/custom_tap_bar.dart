import 'package:flutter/material.dart';
import '../css/size.dart';
import '../css/style.dart';

class CustomTapBar extends StatelessWidget {
  final TabController tabController;
  final String tap1;
  final String tap2;
  const CustomTapBar({
    required this.tabController,
    required this.tap1,
    required this.tap2,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyD7D7D7)
          )
      ),
      child: Theme(
        data: ThemeData().copyWith(
            splashColor: Style.white,
            highlightColor: Style.white
        ),
        child: TabBar(
          overlayColor: WidgetStatePropertyAll(
            Colors.grey.shade50,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Style.yellow,
          indicatorWeight: WidgetSize(context).sizedBox3,
          controller: tabController,
          tabs: [
            SizedBox(
              height:  WidgetSize(context).height60px,
              child: _tapBarText(tap1, context),
            ),
            SizedBox(
                height: WidgetSize(context).height60px,
                child: _tapBarText(tap2, context)
            )
          ],
        ),
      ),
    );
  }

  Widget _tapBarText(String text, BuildContext context){
    return Center(
      child: Text(
        text, style: TextStyle(fontSize: WidgetSize(context).sizedBox18, color: Style.blackWrite, fontWeight: FontWeight.w400),
      ),
    );
  }


}

class CustomTapBar3Button extends StatelessWidget {
  final TabController tabController;
  final String tap1;
  final String tap2;
  final String tap3;
  const CustomTapBar3Button({
    required this.tabController,
    required this.tap1,
    required this.tap2,
    required this.tap3,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyD7D7D7)
          ),
        color: Colors.transparent
      ),
      child: Theme(
        data: ThemeData().copyWith(
          splashColor: Style.white,
          highlightColor: Style.white
        ),
        child: TabBar(
          overlayColor: MaterialStatePropertyAll(
            Colors.grey.shade50,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Style.yellow,
          indicatorWeight: WidgetSize(context).sizedBox3,
          controller: tabController,
          tabs: [
            Container(
              height: WidgetSize(context).height60px,
              child: _tapBarText(tap1, context),
            ),
            Container(
                height: WidgetSize(context).height60px,
                child: _tapBarText(tap2, context)
            ),
            Container(
                height: WidgetSize(context).height60px,
                child: _tapBarText(tap3, context)
            )
          ],
        ),
      ),
    );
  }

  Widget _tapBarText(String text, context){
    return Center(
      child: Text(
        text, style: TextStyle(fontSize: WidgetSize(context).sizedBox16, color: Style.blackWrite, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    );
  }


}



class CustomTapBarStack extends StatelessWidget {
  final TabController tabController;
  final bool tapLeft;
  final bool tapRight;
  final String tap1;
  final String tap2;
  const CustomTapBarStack({
    required this.tabController,
    required this.tapLeft,
    required this.tapRight,
    required this.tap1,
    required this.tap2,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WidgetSize(context).widthCommon,
      height: WidgetSize(context).height60px,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
              bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyD7D7D7)
          )
      ),
      child: Theme(
        data: ThemeData().copyWith(
            splashColor: Style.white,
            highlightColor: Style.white
        ),
        child: TabBar(
          overlayColor: MaterialStatePropertyAll(
            Colors.grey.shade50,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Style.yellow,
          indicatorWeight: WidgetSize(context).sizedBox3,
          controller: tabController,
          tabs: [
            Stack(
              children: [
                SizedBox(
                  height:  WidgetSize(context).height60px,
                  child: _tapBarText(tap1, context),
                ),
                Positioned(
                    top: WidgetSize(context).sizedBox24,
                    left: WidgetSize(context).sizedBox30,
                    child: tapLeft
                        ?
                    Container(
                      decoration: BoxDecoration(
                          color: Style.cocacolaRed,
                          borderRadius: BorderRadius.circular(999)
                      ),
                      width: WidgetSize(context).sizedBox5,
                      height: WidgetSize(context).sizedBox5,
                    ) : SizedBox()
                )
              ],
            ),
            Stack(
              children: [
                SizedBox(
                    height: WidgetSize(context).height60px,
                    child: _tapBarText(tap2, context)
                ),
                Positioned(
                    top: WidgetSize(context).sizedBox24,
                    left: WidgetSize(context).sizedBox26,
                    child: tapRight
                    ? Container(
                      decoration: BoxDecoration(
                          color: Style.cocacolaRed,
                          borderRadius: BorderRadius.circular(999)
                      ),
                      width: WidgetSize(context).sizedBox5,
                      height: WidgetSize(context).sizedBox5,
                    )
                        : SizedBox()
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _tapBarText(String text, BuildContext context){
    return Center(
      child: Text(
        text, style: TextStyle(fontSize: WidgetSize(context).sizedBox18, color: Style.blackWrite, fontWeight: FontWeight.w400),
      ),
    );
  }


}
