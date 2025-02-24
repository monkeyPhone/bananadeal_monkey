import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_asset_image_binder.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CheckMarkColors {
  final Color content;
  final Color background;

  const CheckMarkColors({
    required this.content,
    required this.background,
  });
}

class CheckMarkStyle {
  final CheckMarkColors loading;
  final CheckMarkColors success;
  final CheckMarkColors error;

  const CheckMarkStyle({
    required this.loading,
    required this.success,
    required this.error,
  });

  static const defaultStyle = CheckMarkStyle(
    loading: CheckMarkColors(
      content:  Colors.black,
      background: Colors.transparent,
    ),
    success: CheckMarkColors(
      content: brown,
      background: yellow,
    ),
    error: CheckMarkColors(
      content: Colors.black,
      background: Colors.redAccent,
    ),
  );
}

class BdRefreshIndicator extends StatefulWidget {
  final Widget child;
  final CheckMarkStyle style;
  final AsyncCallback onRefresh;
  final IndicatorController? controller;
  const BdRefreshIndicator({super.key,
    required this.child,
    this.controller,
    this.style = CheckMarkStyle.defaultStyle,
    required this.onRefresh,
  });

  @override
  State<BdRefreshIndicator> createState() => _BdRefreshIndicatorState();
}

class _BdRefreshIndicatorState extends State<BdRefreshIndicator>  with SingleTickerProviderStateMixin  {
  bool _renderCompleteState = false;
  ScrollDirection prevScrollDirection = ScrollDirection.idle;

  bool _hasError = false;

  Future<void> _handleRefresh() async {
    try {
      setState(() {
        _hasError = false;
      });
      await widget.onRefresh();
    } catch (_) {
      setState(() {
        _hasError = true;
      });
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize widgetSize = context.read<VerseConfig>().size;
    return CustomMaterialIndicator(
      controller: widget.controller,
      onRefresh: _handleRefresh,
      displacement: widgetSize.sizedBox45,
      indicatorSize: Size(widgetSize.height60px,widgetSize.height60px),
      elevation: 0,
      durations: const RefreshIndicatorDurations(
        completeDuration: Duration(seconds: 1),
      ),
      onStateChanged: (change) {
        /// set [_renderCompleteState] to true when controller.state become completed
        if (change.didChange(to: IndicatorState.complete)) {
          _renderCompleteState = true;

          /// set [_renderCompleteState] to false when controller.state become idle
        } else if (change.didChange(to: IndicatorState.idle)) {
          _renderCompleteState = false;
        }
      },
      indicatorBuilder: (
          BuildContext context,
          IndicatorController controller,
          ) {
        final CheckMarkColors style;
        if (_renderCompleteState) {
          if (_hasError) {
            style = widget.style.error;
          } else {
            style = widget.style.success;
          }
        } else {
          style = widget.style.loading;
        }

        return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: style.background,
              shape: BoxShape.circle,
            ),
            child:  SizedBox(
              height: widgetSize.sized32grid,
              width: widgetSize.sized32grid,
              child: Padding(
                padding: EdgeInsets.all(widgetSize.sizedBox5),
                child:

                _renderCompleteState || controller.isArmed
                    ? BdAssetImageBinder(
                    imageHeight: widgetSize.sized32grid,
                    imageWidth:  widgetSize.sized32grid,
                    imageUrl: iconBananaBrown
                )
                    : controller.isDragging ?
                CircularProgressIndicator(
                  strokeWidth: widgetSize.sizedBox2,
                  color: style.content,
                  value: controller.isDragging || controller.isArmed
                      ? controller.value.clamp(0.0, 1.0)
                      : null,
                )  : const SizedBox(),
              ),
            )
        );
      },
      child: widget.child,
    );
  }
}

