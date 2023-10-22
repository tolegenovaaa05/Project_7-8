import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aruka_reg/bloc/auth_bloc_bloc.dart';
import 'package:flutter_aruka_reg/data/datapage.dart';

import 'package:flutter_aruka_reg/data/registratiobpage.dart';
import 'package:flutter_aruka_reg/generated/codegen_loader.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ru'), Locale('kk')],
      path: 'assets/translation',
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MultiProvider(
        providers: [
          RepositoryProvider<AuthBlocBloc>(
            create: (context) => AuthBlocBloc(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'User Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RegistrationForm(),
        '/user_table': (context) => UserTable(),
      },
    );
  }
}
