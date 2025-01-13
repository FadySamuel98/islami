import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/quran/item_sura_details.dart';
import 'package:islami/my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details-screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      Image.asset('assets/images/bg3.png'),
      Scaffold(
        appBar: AppBar(
          title: Text(args.name, style: Theme.of(context).textTheme.titleLarge),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: MyTheme.primaryLightColor,
              ))
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.06),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: MyTheme.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                      color: Theme.of(context).primaryColor,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetails(
                      content: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {}
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;

  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
