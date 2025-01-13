import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tap.dart';
import 'package:islami/home/hadeth/item_hadeth_details.dart';
import 'package:islami/my_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details-screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset('assets/images/bg3.png'),
      Scaffold(
        appBar: AppBar(
          title:
              Text(args.title, style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.05,
              vertical: MediaQuery.of(context).size.width * 0.06),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethDetails(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}

class SuraDetailsArgs {
  String name;

  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
