import 'package:flutter/material.dart';
import 'package:news_clean/featutes/news/presentation/pages/news_page.dart';

// import 'injection_container.dart' as di;
import 'package:news_clean/injection_injectable_package.dart ' as di;

// final getIt = GetIt.instance;

// @module
// abstract class RegisterModule {
//   @lazySingleton
//   InternetConnectionChecker get prefs => InternetConnectionChecker();
//   @lazySingleton
//   http.Client get client => http.Client();
// }

// @InjectableInit(
//   initializerName: r'$init',
//   preferRelativeImports: true,
//   asExtension: false,
// )
// void configureDependencies() => $init(getIt);

void main() async {
  // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  di.configureDependencies();
  // await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}
