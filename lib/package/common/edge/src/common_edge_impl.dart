import 'package:banana_deal_by_monkeycompany/package/common/edge/common_edge.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';
import 'package:flutter/material.dart';

class CommonEdgeImpl extends CommonEdge{
  @override
  final EdgeInsets pad0016;
  @override
  final EdgeInsets pad0008;
  @override
  final EdgeInsets pad0808;
  @override
  final EdgeInsets pad3216;
  @override
  final EdgeInsets pad1616;
  @override
  final EdgeInsets pad1600;
  CommonEdgeImpl({
    required CommonSize size
  }) :  pad0016 = EdgeInsets.symmetric(
          horizontal: size.sized16grid
        ),
        pad0008 = EdgeInsets.symmetric(
            horizontal: size.sized8grid
        ),
        pad0808 = EdgeInsets.all(
            size.sized8grid
        ),
        pad3216 = EdgeInsets.symmetric(
          vertical: size.sized32grid,
          horizontal: size.sized16grid
        ),
        pad1616 = EdgeInsets.all(
            size.sized16grid
        ),
        pad1600 = EdgeInsets.symmetric(
            vertical: size.sized16grid,
        );


}