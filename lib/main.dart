import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],

      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      // home: HomePage());
      initialRoute: '/',
      routes: getApplicationRoutes(),
      // <String, WidgetBuilder>{
      //   '/': (BuildContext context) => HomePage(),
      //   'alert': (BuildContext context) => AlertPage(),
      //   'avatar': (BuildContext context) => AvatarPage(),

      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
