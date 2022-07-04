import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolistrefresh/provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: selectedTheme(AppLocalizations.of(context)!.ligth,
                  themeProvider.themeMode == ThemeMode.light)),
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: selectedTheme(AppLocalizations.of(context)!.dark,
                  themeProvider.themeMode == ThemeMode.dark))
        ],
      ),
    );
  }

  Widget selectedTheme(String theme, bool isSelcted) {
    if (isSelcted) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              theme,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Icon(Icons.check)
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            theme,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
