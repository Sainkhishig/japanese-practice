import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/hive_db/provider/n5_box_provider.dart';
import 'package:japanese_practise_n5/pages/excel_import/jlpt_word/jlpt_word_page.dart';
import 'package:japanese_practise_n5/pages/grammar/grammar.dart';
import 'package:japanese_practise_n5/pages/kanji/kanji.dart';
import 'package:japanese_practise_n5/pages/listening/lisyening_page.dart';
import 'package:japanese_practise_n5/pages/reading/reading_n5.dart';
import 'package:japanese_practise_n5/pages/vocabulary/vocabulary_page.dart';

import 'common_page_controller.dart';

class CommonFrame extends StatelessWidget {
  const CommonFrame({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Хишиг эрдэм',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        // primarySwatch: Colors.blue,
      ),
      home: CommonPage2(),
    );
  }
}

class CommonPage2 extends HookConsumerWidget {
  CommonPage2({Key? key}) : super(key: key);
  late N5Box lstN5;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(commonPageProvider.notifier);
    lstN5 = ref.read(n5BoxDataProvider);
    controller.setModelListenable(ref);
    var bodyPage = !controller.state.isGameMode
        ? lstMenu[controller.state.selectedIndex].listPage
        : lstMenu[controller.state.selectedIndex].entryPage;
    return AdaptiveNavigationScaffold(
      appBar: AdaptiveAppBar(
        title: Text(lstMenu[controller.state.selectedIndex].name),
        actions: [
          ButtonBar(
            children: [
              IconButton(
                  onPressed: () {
                    controller.setGameMode(!controller.state.isGameMode);
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
      body: Scaffold(
          body: Row(
        children: [
          Expanded(
            child: Center(child: bodyPage),
          ),
        ],
      )),
      selectedIndex: controller.state.selectedIndex,
      onDestinationSelected: (value) {
        if (value == (lstMenu.length - 1)) {
          controller.setGameMode(!controller.state.isGameMode);
        }
        controller.setSelectedIndex(value);
      },
      destinations: _buildDestinations2(context, controller),
      drawerHeader: ListTile(
        contentPadding: const EdgeInsets.all(4),
        onTap: () {
          Navigator.of(context).pop();
        },
        // tileColor: Colors.black,
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              margin: const EdgeInsets.only(bottom: 20),
              constraints: const BoxConstraints.expand(height: 150.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 4.0, color: Colors.amber),
                  bottom: BorderSide(width: 4.0, color: Colors.amber),
                ),
                // color: Colors.blue
              ),
              child: Image.asset(
                "assets/images/logo-removebg-preview.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 250,
              padding: const EdgeInsets.only(top: 20),
              child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                hint: const Text("түвшингээ сонго"),
                isDense: true,
                items: getDropItems(),
                value: controller.jlptLevel,
                onChanged: (value) {
                  var selectedLevel = int.parse("$value");
                  controller.setJlptLevel(selectedLevel);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> getDropItems() {
    List<DropdownMenuItem<int>> lstDropItem = [];
    for (var i = 1; i <= 5; i++) {
      lstDropItem.add(DropdownMenuItem<int>(
          alignment: AlignmentDirectional.center,
          value: i,
          child: Text(
            "N$i түвшин",
            textAlign: TextAlign.center,
          )));
    }
    return lstDropItem;
  }

  List<AdaptiveScaffoldDestination> _buildDestinations2(
      BuildContext context, CommonPageController controller) {
    return lstMenu
        .map((menu) => AdaptiveScaffoldDestination(
              title: menu.name,
              icon: menu.icon,
            ))
        .toList();
  }
}

class Menu {
  late String name;
  late String destination;
  late IconData icon;
  late Widget listPage;
  late Widget entryPage;
  Menu(this.name, this.destination, this.icon, this.listPage, this.entryPage);
}

late final lstMenu = <Menu>[
  Menu("Шинэ үг", "vocabulary", Icons.format_list_numbered, VocabularyPage(),
      VocabularyPage()),
  Menu(
    "Дүрэм",
    "grammar",
    Icons.rule,
    GrammarPage(),
    GrammarPage(),
  ),
  Menu("Сонсгол", "verbForm", CupertinoIcons.ear, ListeningTestPage(),
      ListeningTestPage()),
  Menu("Уншлага", "verbForm", Icons.menu_book, ReadingN5(), ReadingN5()),
  Menu("Ханз", "verbForm", CupertinoIcons.pencil_outline, KanjiPage(),
      KanjiPage()),
  Menu("Excel", "excel", CupertinoIcons.pencil_outline, const JlptWordPage(),
      const JlptWordPage())
];
