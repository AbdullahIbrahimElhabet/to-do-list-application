import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolistrefresh/provider/provider.dart';
import 'package:todolistrefresh/settings_screen/language_bottom_sheet.dart';
import 'package:todolistrefresh/settings_screen/theme_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppProvider>(context);
    var themeProvider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Text(
                  langProvider.currebtLanguag == "en" ? "English" : "العربية",
                  style: Theme.of(context).textTheme.headline2,
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Text(
                  themeProvider.themeMode == ThemeMode.light
                      ? AppLocalizations.of(context)!.ligth
                      : AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.headline2,
                )),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ThemeBottomSheet();
        });
  }
}
