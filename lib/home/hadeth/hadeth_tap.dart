import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/item_hadeth_name.dart';
import 'package:islami/my_theme.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadFile();
    }

    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadith_logo.png')),
        Divider(
          thickness: 3,
          color: Theme.of(context).primaryColor,
        ),
        Text('Hadith Name', style: Theme.of(context).textTheme.titleLarge),
        Divider(
          thickness: 3,
          color: Theme.of(context).primaryColor,
        ),
        ahadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: MyTheme.primaryLightColor,
                ),
              )
            : Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 2,
                        color: Theme.of(context).primaryColor,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ItemHadethName(
                        hadeth: ahadethList[index],
                      );
                    },
                    itemCount: ahadethList.length))
      ],
    );
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
