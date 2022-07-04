import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistrefresh/home_screen.dart';
import 'package:todolistrefresh/my_theme.dart';
import 'package:todolistrefresh/provider/provider.dart';
import 'package:todolistrefresh/tasks_screen/edit_task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (BuildContext) {
        return AppProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppProvider langProvider;
  late AppProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    langProvider = Provider.of<AppProvider>(context);
    themeProvider = Provider.of<AppProvider>(context);
    sharedPrefrensh();
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Arabic, no country code
      ],
      locale: Locale(langProvider.currebtLanguag),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),
        EditTaskScreen.screenName: (context) => EditTaskScreen()
      },
      initialRoute: HomeScreen.screenName,
      theme: MyTheme.ligthTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: themeProvider.themeMode,
    );
  }

  void sharedPrefrensh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    langProvider.changeLanguage(prefs.getString("lang") ?? "en");
    if (prefs.getString("theme") == "ligth") {
      themeProvider.changeTheme(ThemeMode.light);
    } else if (prefs.getString("theme") == "dark") {
      themeProvider.changeTheme(ThemeMode.dark);
    }
  }
}
