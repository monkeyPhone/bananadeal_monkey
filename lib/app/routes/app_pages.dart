import 'package:banana_deal_by_monkeycompany/app/modules/main/banner_button/banner_button_bindings.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/main/banner_button/banner_button_page.dart';
import 'package:get/get.dart';
import '../modules/main/auth/auth_page.dart';
import '../modules/sign/bindings/sign_add_bindings.dart';
import '../modules/sign/bindings/sign_bindings.dart';
import '../modules/sign/views/pages/sign1/sign_view_1.dart';
import '../modules/sign/views/pages/sign2/sign_view_2.dart';
import '../modules/sign/views/pages/sign3/sign_view_3.dart';
import '../modules/splash/bindings/splash_bindings.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/src/pages/deal/components/post_deal/bindings/make_deal_bindings.dart';
import '../modules/src/pages/deal/components/post_deal/moduels/make_deal/views/make_deal_view.dart';
import '../modules/src/pages/widgets/service/service_moduels/chating_binding.dart';
import '../modules/src/pages/widgets/service/service_moduels/views/chat_log_view.dart';
import '../modules/src/src_components/src_bindings.dart';
import '../modules/src/src_components/src_view.dart';
import 'init_bindings.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBindings()
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthPage(),
      binding: InitBindings(),
    ),
    GetPage(
      name: _Paths.SIGN1,
      page: () => SignView1(),
      binding:  SignBindings()
    ),
    GetPage(
        name: _Paths.SIGN2,
        page: () => SignView2(),
        binding:  SignBindings()
    ),
    GetPage(
        name: _Paths.SIGNADD,
        page: () => SignView3(),
        binding:  SignAddBindings()
    ),
    GetPage(
        name: _Paths.SRC,
        page: () => SrcView(),
        binding:  SrcBindings(),
        transitionDuration: Duration(milliseconds: 0)
    ),
    GetPage(
        name: _Paths.MAKEDEAL,
        page: () => MakeDealView(),
        binding:  MakeDealBindings()
    ),
    GetPage(
      name: _Paths.CHATING,
      page: () => ChatLogView(),
      binding: ChatingBindings()
    ),
    GetPage(
      name: _Paths.BANNERPAGE,
      page: () => BannerButtonPage(),
      binding: BannerButtonBindings(),
      transitionDuration: Duration(milliseconds: 0)
    ),

  ];
}