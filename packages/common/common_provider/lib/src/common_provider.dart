import 'package:common_cache/common_cache.dart';
import 'package:common_network/common_network.dart';
import 'package:common_url/common_url.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CommonProvider extends StatelessWidget {
  final MultiRepositoryProvider child;
  const CommonProvider({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CommonUrlImpl>(
            create: (BuildContext context) =>
                CommonUrlImpl(
                    mode: CacheMainSgt.baseDomain,
                    port: CacheMainSgt.basePortHome,
                    chatPort: CacheMainSgt.basePortChat
                )
        ),
        RepositoryProvider<CommonCacheImpl>(
            create: (BuildContext context) =>
                CommonCacheImpl()
        ),
        RepositoryProvider<CommonNetworkImpl>(
            create: (BuildContext context) =>
                CommonNetworkImpl(
                    commonCache: context.read<CommonCacheImpl>(),
                    commonUrl: context.read<CommonUrlImpl>()
                )
        ),
      ],
      child: child,
    );
  }
}
