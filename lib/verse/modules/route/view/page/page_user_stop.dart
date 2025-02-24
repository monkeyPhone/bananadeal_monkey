import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/noti_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/fcm_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/repository/fcm_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/state/cubit/banana_fcm/banana_fcm_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/stop_user/view/stop_user_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';


GoRoute userStop = GoRoute(
    path: pageUserStop,
    builder: (BuildContext context, GoRouterState state){
      return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<FcmRepositoryImpl>(
                create: (BuildContext context) =>
                    FcmRepositoryImpl(
                        helper: FcmSingleton.managerNotiHelper,
                        dio: context.read<VerseConfig>().dio,
                        snackBar: context.read<VerseConfig>().browser.snackBar,
                        notiCache: NotiCacheSingleton()
                    )
            ),
          ],
          child: MultiBlocProvider(
              providers: [
                BlocProvider<BananaFcmCubit>(
                    create: (BuildContext context) =>
                        BananaFcmCubit(
                            mainContext: context,
                            repository: context.read<FcmRepositoryImpl>()
                        )
                )
              ],
              child: const StopUserView()
          )
      );





      // MultiRepositoryProvider(
      //     providers: [
      //       RepositoryProvider<NotiRepositoryRes>(
      //         create: (BuildContext context) => NotiRepositoryRes(),
      //       ),
      //     ],
      //     child: MultiBlocProvider(
      //       providers: [
      //         BlocProvider<BananaSrcNotiCubit>(
      //           create: (BuildContext context) =>
      //               BananaSrcNotiCubit(
      //                   notiRepository: context.read<NotiRepositoryRes>(),
      //                 context: context,
      //
      //               ),
      //         ),
      //       ],
      //       child: const HomeUi(),
      //     )
      // );




      //   RepositoryProvider<NotiRepositoryRes>(
      //   create: (BuildContext context) => NotiRepositoryRes(),
      //   child: BlocProvider<BananaSrcNotiBloc>(
      //     create: (BuildContext context) =>
      //     BananaSrcNotiBloc(
      //         context.read<NotiRepositoryRes>()
      //     )..add(RemoteNoti(context,
      //     )),
      //     child:  const HomeUi()
      //   ),
      // );
    }
);