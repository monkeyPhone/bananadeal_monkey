import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_sort_button.dart';
import 'package:flutter/material.dart';

class ComponentRateListSortBarView extends StatelessWidget {
  final CommonSize size;
  final int currentSort;
  final List<GestureTapCallback> onTap;
  const ComponentRateListSortBarView({super.key,
    required this.size,
    required this.currentSort,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: size.sized16grid
      ),
      width: size.widthCommon,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.sized16grid),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
            Row(
              children: [
                BdRippleSortButton(
                  size: size,
                  text: '기본순',
                  isSort: currentSort == 0,
                  onTap: onTap[0],
                ),
                BdRippleSortButton(
                  size: size,
                  text: currentSort == 2 ? '기본료순 ↑' : '기본료순 ↓',
                  isSort: currentSort == 1 || currentSort == 2,
                  onTap: onTap[1],
                ),
                BdRippleSortButton(
                  size: size,
                  text: '최신순',
                  isSort: currentSort == 3,
                  onTap: onTap[2],
                ),
                BdRippleSortButton(
                  size: size,
                  text: currentSort == 5 ? '이름순 ↑' : '이름순 ↓',
                  isSort: currentSort == 4 || currentSort == 5,
                  onTap: onTap[3],
                ),
              ],
            )
        ),
      ),
    );
  }
}
