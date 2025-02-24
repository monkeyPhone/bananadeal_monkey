import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/picker/model/action/picker_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/picker/model/picker_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/model/action/upload_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/model/upload_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_reg/model/action/user_reg_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_reg/model/user_reg_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/register/src/register_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_route.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/view/info_user_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GoRoute userInfo = GoRoute(
    path: pageUserInfo,
    builder: (BuildContext context, GoRouterState state){

      return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<UploadApiImpl>(
              create: (BuildContext context) =>
              const UploadApiImpl(
                action: UploadAction()
              )
            ),
            RepositoryProvider<UserRegApiImpl>(
                create: (BuildContext context) =>
                    const UserRegApiImpl(
                        action: UserRegAction(),
                    )
            ),
            RepositoryProvider<PickerApiImpl>(
                create: (BuildContext context) =>
                  const PickerApiImpl(
                    action: PickerAction()
                  )
            ),
            RepositoryProvider<RegisterRepositoryImpl>(
                create: (BuildContext context) =>
                    RegisterRepositoryImpl(
                        api: context.read<UserRegApiImpl>(),
                        uploadApi: context.read<UploadApiImpl>(),
                        pickerApi: context.read<PickerApiImpl>(),
                        dio: context.read<VerseConfig>().dio,
                        provider: context.read<VerseConfig>().cache.authCacheProvider
                    )
            ),
            RepositoryProvider<InfoUserManager>(
                create: (BuildContext context) {
                  return const InfoUserManager();
                },
            )
          ],
          child: MultiBlocProvider(
              providers: [

                BlocProvider<BananaInfoUserBloc>(
                    create: (BuildContext context) =>
                        BananaInfoUserBloc(
                          repository: context.read<RegisterRepositoryImpl>(),
                          commonFunction: context.read<VerseConfig>().function,
                          route: context.read<VerseConfig>().route,
                          snackBar: context.read<VerseConfig>().browser.snackBar,
                          tabManager: context.read<VerseConfig>().tab,
                        )
                )
              ],
              child: const InfoUserView()
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