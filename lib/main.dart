import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meddapp/screens/home_screen.dart';
import 'package:meddapp/screens/booking_medcin.dart';
import 'package:meddapp/screens/booking_pharmacie.dart';
import 'package:meddapp/screens/booking_laboratoire.dart';
import 'package:meddapp/screens/booking_medicaments.dart';
import 'package:meddapp/screens/favoris.dart';
import 'package:meddapp/screens/question_screen.dart';
import 'package:meddapp/screens/article_screen.dart';
import 'package:meddapp/screens/signin_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // Langue de l'application (par défaut en français)
  Locale _locale = Locale('fr');
  bool _isDarkMode = false; // Gérer l'état du thème
  // Fonction pour changer la langue
  void _changeLanguage(String languageCode) {
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  // Fonction pour basculer entre le mode clair et sombre
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light, // Appliquer le mode
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      locale: _locale, // Langue actuelle
      supportedLocales: [
        Locale('en', 'US'), // Anglais
        Locale('fr', 'FR'), // Français
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(changeLanguage: _changeLanguage, toggleTheme: _toggleTheme),
        '/booking_medcin': (context) => BookingScreen(),
        '/booking_pharmacie': (context) => PharmaciesScreen(),
        '/booking_laboratoire': (context) => LaboratoriesScreen(),
        '/booking_medicaments': (context) => MedicationsScreen(),
        '/articles': (context) => ArticlesScreen(),
        '/questions': (context) => QuestionsScreen(),
        '/favoris': (context) => FavoritesScreen(),
      },
    );
  }
}





