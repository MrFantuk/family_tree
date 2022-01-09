import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_tree/ui/general/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:theme_provider/theme_provider.dart';

import 'bloc/user_auth_bloc/user_auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Parse().initialize(
  //   "sa5ze0xDlM6fG1rsYLA5VIOJ9ZK8hTVOR6EigXwJ",
  //   "https://parseapi.back4app.com",
  //   clientKey: "lP0oHFnmiBa6SRr64cnGhQlpdBfdBb3T7Et8d0LL",
  //   autoSendSessionId: true,
  // );
  await Parse().initialize(
    "myappID",
    "https://parse-app.agrrh.com/parse",
    autoSendSessionId: true,
  );

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
          builder: (themeContext) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => UserAuthBloc()..add(EventUserAuthInit()),
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Flutter Demo',
              theme: ThemeData.light().copyWith(primaryColor: Colors.blue),
              home: const MainScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
