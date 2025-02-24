enum Flavor { prod, dev , type}

// class AppConfig {
//
//   String baseMode = '';
//   String basePort = '';
//   Flavor flavor = Flavor.dev;
//
//   static AppConfig shared = AppConfig.create();
//
//   factory AppConfig.create({
//     String baseMode = "",
//     String basePort = "",
//     Flavor flavor = Flavor.dev,
//   }) {
//     return shared = AppConfig(baseMode, basePort, flavor);
//   }
//
//   AppConfig(this.baseMode, this.basePort, this.flavor);
// }

class AppConfig {
  // static final AppConfig instance = AppConfig._internal();
  // factory AppConfig() => instance;
  // AppConfig._internal();


  static late final String baseDomain;
  static late final String basePort;
  static late final Flavor baseMode;

  static void create({required String domain, required String port, required Flavor mode}) {
    baseDomain = domain;
    basePort = port;
    baseMode = mode;
  }

}