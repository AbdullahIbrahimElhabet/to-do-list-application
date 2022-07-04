import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistrefresh/provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppProvider>(context);
    return Container(
      // color: Colors.white,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                langProvider.changeLanguage("en");
                Navigator.pop(context);
              },
              child:
                  selectedLang("English", langProvider.currebtLanguag == "en")),
          InkWell(
              onTap: () {
                langProvider.changeLanguage("ar");
                Navigator.pop(context);
              },
              child:
                  selectedLang("العربية", langProvider.currebtLanguag == "ar"))
        ],
      ),
    );
  }

  Widget selectedLang(String language, bool isSelcted) {
    if (isSelcted) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(language), Icon(Icons.check)],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(language),
        ],
      ),
    );
  }
}
