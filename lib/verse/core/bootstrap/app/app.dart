import 'package:banana_deal_by_monkeycompany/config/verse/theme_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/model/action/chat_connect_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/model/chat_connect_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/action/chat_room_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_room/model/chat_room_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/action/check_version_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/check_version_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/action/permission_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/func/permission_func.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/permission_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_info/model/action/user_info_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_info/model/user_info_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/src/common_size_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/route/src/route_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/tab_chat/src/tab_chat_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/bootstrap/app/widgets/frame/web_frame.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/provider/auth_cache_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/main_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/action/dio_api_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/helper/dio_api_logger.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/provider/dio_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio_convert/model/func/dio_convert_api_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio_convert/provider/dio_convert_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/repository/dio_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/action/method_api_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/provider/method_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/repository/method_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/action/route_api_action.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/func/route_api_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/model/helper/route_helper_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/api/provider/route_provider.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/route/repository/route_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/manager/route_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/view/banana_deal_router.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/manager/tab_manager_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/browser_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/image/browser_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/sheet/browser_bottom_sheet.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/sheet/browser_bottom_sheet_option.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height =  MediaQuery.of(context).size.height;
    final double origin = MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width : ((height*440)/956);
    if (kDebugMode) {
      print('what happen in log: $origin, $width, $height');
    }
    return MultiRepositoryProvider(
      providers: [

        RepositoryProvider<CommonUrl>(
            create: (BuildContext context) =>
                CommonUrl()
        ),


        RepositoryProvider<DioApiActionImpl>(
            create: (BuildContext context) =>
                const DioApiActionImpl()
        ),

        RepositoryProvider<DioApiLogger>(
            create: (BuildContext context) =>
                DioApiLogger()
        ),

        RepositoryProvider<Connectivity>(
            create: (BuildContext context) =>
                Connectivity()
        ),


        RepositoryProvider<DioProviderImpl>(
            create: (BuildContext context) =>
                DioProviderImpl(
                    commonUrl: context.read<CommonUrl>(),
                    action: context.read<DioApiActionImpl>(),
                    helper: context.read<DioApiLogger>(),
                    connectivity: context.read<Connectivity>()
                )
        ),

        RepositoryProvider<DioConvertApiFuncImpl>(
            create: (BuildContext context) =>
                const DioConvertApiFuncImpl()
        ),

        RepositoryProvider<DioConvertProviderImpl>(
            create: (BuildContext context) =>
                DioConvertProviderImpl(
                    func: context.read<DioConvertApiFuncImpl>()
                )
        ),

        RepositoryProvider<AuthCacheProviderImpl>(
            create: (BuildContext context) =>
                AuthCacheProviderImpl()
        ),

        RepositoryProvider<DioRepositoryImpl>(
            create: (BuildContext context) => DioRepositoryImpl(
                dioProvider: context.read<DioProviderImpl>(),
                convert: context.read<DioConvertProviderImpl>(),
                authCacheProvider: context.read<AuthCacheProviderImpl>(),
                commonUrl: context.read<CommonUrl>()
            )
        ),


        RepositoryProvider<CommonCache>(
            create: (BuildContext context) =>CommonCache(
                authCacheProvider: context.read<AuthCacheProviderImpl>(),
                mainCache: MainCache(
                    isHeight60: MainCacheSingleton.deviceEntity.isHeight60,
                    isIos: MainCacheSingleton.deviceEntity.isIos,
                    deviceFunc: MainCacheSingleton.func,
                    prefs: MainCacheSingleton.prefs,
                    deviceEntity: MainCacheSingleton.deviceEntity
                )
            )
        ),

        RepositoryProvider<CommonSizeImpl>(
            create: (BuildContext context) => CommonSizeImpl(
                widthCommon: width,
                heightCommon: height,
                origin: origin,
            )
        ),

        RepositoryProvider<RouteManagerImpl>(
          create: (BuildContext context) =>
          const RouteManagerImpl(),
        ),

        RepositoryProvider<RouteApiFunc>(
            create: (BuildContext context) =>
                const RouteApiFunc()
        ),

        RepositoryProvider<RouteApiAction>(
            create: (BuildContext context) =>
            const RouteApiAction()
        ),

        RepositoryProvider<RouteHelperDialog>(
            create: (BuildContext context) =>
            const RouteHelperDialog()
        ),

        RepositoryProvider<RouteProviderImpl>(
          create: (BuildContext context) =>
           RouteProviderImpl(
               func: context.read<RouteApiFunc>(),
               action: context.read<RouteApiAction>(),
               deviceFunc: context.read<CommonCache>().mainCache.deviceFunc,
               dioProvider:  context.read<DioProviderImpl>(),
               helperDialog: context.read<RouteHelperDialog>()
           ),
        ),

        RepositoryProvider<BrowserSnackbar>(
          create: (BuildContext context) =>
          const BrowserSnackbar(),
        ),

        RepositoryProvider<BrowserDialog>(
          create: (BuildContext context) =>
          const BrowserDialog(),
        ),

        RepositoryProvider<CommonRouteRepositoryImpl>(
            create: (BuildContext context) =>
                CommonRouteRepositoryImpl(
                  routeManager: context.read<RouteManagerImpl>(),
                  routeProvider: context.read<RouteProviderImpl>(),
                  dialog: context.read<BrowserDialog>(),
                  snackbar: context.read<BrowserSnackbar>(),

            )
        ),

        RepositoryProvider<MethodApiAction>(
           create: (BuildContext context) => const MethodApiAction()
        ),

        RepositoryProvider<MethodProviderImpl>(
            create: (BuildContext context) =>
            MethodProviderImpl(
                action: context.read<MethodApiAction>(),
                dialog: context.read<BrowserDialog>(),
            )
        ),
        RepositoryProvider<ChatConnectApiImpl>(
            create: (BuildContext context) =>
                const ChatConnectApiImpl(action: ChatConnectAction())
        ),
        RepositoryProvider<ChatRoomApiImpl>(
            create: (BuildContext context) =>
            const ChatRoomApiImpl(action: ChatRoomAction())
        ),
        RepositoryProvider<TabChatRepositoryImpl>(
            create: (BuildContext context) => TabChatRepositoryImpl(
                chatConnectApi: context.read<ChatConnectApiImpl>(),
                chatRoomApi: context.read<ChatRoomApiImpl>(),
                mainPrefs: context.read<CommonCache>().mainCache.prefs,
                dio: context.read<DioRepositoryImpl>()
            ),
        ),
        RepositoryProvider<TabManagerImpl>(
          create: (BuildContext context) =>
              TabManagerImpl(
                  snackbar: context.read<BrowserSnackbar>(),
                  isIos: context.read<CommonCache>().mainCache.isIos,
                  tabChatRepository: context.read<TabChatRepositoryImpl>()
          ),
        ),

        RepositoryProvider<MethodRepositoryImpl>(
          create: (BuildContext context) =>
              MethodRepositoryImpl(
                  provider: context.read<MethodProviderImpl>()
              ),
        ),

        RepositoryProvider<BrowserImage>(
          create: (BuildContext context) =>
          const BrowserImage(),
        ),

        RepositoryProvider<BrowserBottomSheetOption>(
            create: (BuildContext context) =>
            const BrowserBottomSheetOption()
        ),

        RepositoryProvider<BrowserBottomSheet>(
          create: (BuildContext context) =>
              BrowserBottomSheet(
                  option: context.read<BrowserBottomSheetOption>()
              ),
        ),

        RepositoryProvider<CommonBrowser>(
          create: (BuildContext context) =>
              CommonBrowser(
                  snackBar: context.read<BrowserSnackbar>(),
                  dialog: context.read<BrowserDialog>(),
                  image: context.read<BrowserImage>(),
                  sheet: context.read<BrowserBottomSheet>()
              ),
        ),

        RepositoryProvider<CommonFunction>(
          create: (BuildContext context) =>
          const CommonFunction(),
        ),

        RepositoryProvider<VerseConfig>(
          create: (BuildContext context) => VerseConfig(
              dio: context.read<DioRepositoryImpl>(),
              cache: context.read<CommonCache>(),
              url: context.read<CommonUrl>(),
              route: context.read<CommonRouteRepositoryImpl>(),
              browser: context.read<CommonBrowser>(),
              method: context.read<MethodRepositoryImpl>(),
              function: context.read<CommonFunction>(),
              tab: context.read<TabManagerImpl>()
          ),
        ),


        RepositoryProvider<PermissionApiImpl>(
            create: (BuildContext context) => PermissionApiImpl(
                action: PermissionAction(),
                func: PermissionFunc(),
            )
        ),

        RepositoryProvider<CheckVersionApiImpl>(
            create: (BuildContext context) =>
                const CheckVersionApiImpl(
                    action: CheckVersionAction(),
                )
        ),

        RepositoryProvider<UserInfoApiImpl>(
            create: (BuildContext context) =>
                const UserInfoApiImpl(
                    action: UserInfoAction(),
                )
        ),


        RepositoryProvider<RouteRepositoryImpl>(
          create: (BuildContext context) =>
              RouteRepositoryImpl(
                  dio: context.read<DioRepositoryImpl>(),
                  commonFunction: context.read<CommonFunction>(),
                  permissionApi: context.read<PermissionApiImpl>(),
                  checkVersionApi: context.read<CheckVersionApiImpl>(),
                  userInfoApi: context.read<UserInfoApiImpl>(),
                  mainPrefs: context.read<CommonCache>().mainCache.prefs,
                  deviceFunc: context.read<CommonCache>().mainCache.deviceFunc,
                  deviceEntity: context.read<CommonCache>().mainCache.deviceEntity,

              ),
        ),



      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaRouteCubit>(
                create: (BuildContext context) =>
                    BananaRouteCubit(
                        routeRepository: context.read<RouteRepositoryImpl>(),
                        authCacheProvider: context.read<AuthCacheProviderImpl>()
                    )
            ),


            // BlocProvider.value(value: routingCubit),
          ],
          child: !kIsWeb
              ? const _BananaDeal()
              : FlutterWebFrame(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              enabled: true,
              builder: (BuildContext context) =>  const _BananaDeal(),
              maximumSize: Size(
                  context.read<CommonSizeImpl>().heightCommon*0.56,
                  context.read<CommonSizeImpl>().heightCommon
              )
          )
      ),
    );
  }
}

class _BananaDeal extends StatelessWidget {
  const _BananaDeal();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery.withNoTextScaling(
            child: child!
        );
      },

      routerConfig: bananaDealRouter,
      debugShowCheckedModeBanner: false,
      color: crowdFlower,
      title: '바나나딜 개발모드',
      theme: ThemeConfig(
        size: context.read<CommonSizeImpl>()
      , isDark: false).theme,
    );
  }
}


