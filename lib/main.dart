import 'package:easy_localization/easy_localization.dart';

import 'package:family_tree/ui/general/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('ru', ''),
        ], // Ru, no country code,
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Demo',
            theme: ThemeData.light().copyWith(primaryColor: Colors.blue),
            home: const MainScreen(),
          ),
        ),
      ),
    );
  }
}
