import 'package:common_provider/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_api/permission_api.dart';

class BdDataProvider extends StatelessWidget {
  final MultiRepositoryProvider child;
  const BdDataProvider({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CommonProvider(
      child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<PermissionApiImpl>(
                create: (BuildContext context) =>
                    PermissionApiImpl(
                        commonCache: context.read<CommonCacheImpl>()
                    )
            ),
          ],
          child: child
      ),
    );
  }
}
