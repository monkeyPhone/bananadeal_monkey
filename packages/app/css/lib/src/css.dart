import 'package:css/src/size/css_size_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CssProvider extends StatelessWidget {
  final double widthCommon;
  final double heightCommon;
  final double origin;
  final Widget child;
  const CssProvider({super.key,
    required this.child,
    required this.widthCommon,
    required this.heightCommon,
    required this.origin
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CssSizeImpl>(
            create: (BuildContext context) =>
                CssSizeImpl(
                    widthCommon: widthCommon,
                    heightCommon: heightCommon,
                    origin: origin
                )
        ),
      ],
      child: child,
    );
  }
}
