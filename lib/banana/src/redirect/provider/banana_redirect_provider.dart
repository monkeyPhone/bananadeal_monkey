import 'package:banana_deal_by_monkeycompany/banana/src/redirect/bloc/banana_redirect/banana_redirect_bloc.dart';
import 'package:data_repository_provider/data_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BananaRedirectProvider extends StatelessWidget {
  final Widget child;
  const BananaRedirectProvider({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BananaRedirectBloc>(
        create: (BuildContext context) =>
            BananaRedirectBloc(
              redirectRepository: context.read<RedirectRepositoryImpl>()
            )..add(const RedirectAdsAction()),
      child: child,
    );
  }
}
