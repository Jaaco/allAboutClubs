import 'package:all_about_clubs/providers/club_provider.dart';
import 'package:all_about_clubs/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClubProvider>(
          create: ((context) => ClubProvider()),
        ),
      ],
      child: MaterialApp(
        title: 'all about clubs',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff01C13B), //* to change theme
          ),
        ),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('de', 'DE'),
          Locale('pl', 'PL'),
        ],
        localizationsDelegates: [
          // delegate from flutter_localization
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // delegate from localization package.
          LocalJsonLocalization.delegate,
        ],
        home: const HomeScreen(),
      ),
    );
  }
}
