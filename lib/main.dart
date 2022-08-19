import 'package:e_shop/presentation/resources/theme_manager.dart';
import 'package:e_shop/presentation/resources/value_manager.dart';
import 'package:e_shop/presentation/view_model/on_boarding_view_model.dart';
import 'package:e_shop/presentation/view_model/search_filter_view_model.dart';
import 'package:e_shop/presentation/view_model/home_view_model.dart';
import 'package:e_shop/presentation/views/on_boarding_view/on_boarding_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => OnBoardingViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => SearchFilterViewModel(),
          ),
        ],
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
          AppSizeManager.sWidth,
          AppSizeManager.sHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context) {
          return MaterialApp(
            onGenerateTitle: (BuildContext context) {
              return tr("app_title");
            },
            theme: ThemeManager.getAppThemeData(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const OnBoardingView(),
          );
        });
  }
}
