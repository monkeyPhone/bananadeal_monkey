import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redirect_repository/redirect_repository.dart';

class DataRepositoryProvider extends StatelessWidget {
  final Widget child;
  const DataRepositoryProvider({super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return BdDataProvider(
      child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<RedirectRepositoryImpl>(
                create: (BuildContext context) =>
                    RedirectRepositoryImpl(
                        permissionApi: context.read<PermissionApiImpl>()
                    )
            ),
          ],
          child: child
      ),
    );
  }
}
