import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/hive_db/provider/n5_box_provider.dart';
import 'package:japanese_practise_n5/pages/kanji/detail/kanji_detail.dart';
import 'package:japanese_practise_n5/pages/kanji/kanji.dart';
import 'package:japanese_practise_n5/pages/kanji/list/kanji_list.dart';
import 'package:japanese_practise_n5/pages/reading/detail/reading_detail.dart';
import 'package:japanese_practise_n5/pages/reading/list/reading_list.dart';
import 'package:japanese_practise_n5/pages/reading/reading_n5.dart';

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
            // const Text("N5"),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(" Флип горим:"),
            //     Switch(
            //       value: controller.state.isGameMode,
            //       onChanged: (value) {
            //         controller.setGameMode(!controller.state.isGameMode);
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
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
  Menu(
    "Шинэ үг",
    "vocabulary",
    Icons.format_list_numbered,
    const Text("shine uug"),
    const Text("shine uug"),
  ),
  Menu(
    "Дүрэм",
    "grammar",
    Icons.rule,
    const Text("durem"),
    const Text("durem"),
  ),
  Menu("Сонсгол", "verbForm", CupertinoIcons.ear, ReadingDetail(),
      ReadingDetail()),
  Menu("Уншлага", "verbForm", Icons.menu_book, ReadingN5(), ReadingDetail()),
  Menu("Ханз", "verbForm", CupertinoIcons.pencil_outline, KanjiPage(),
      KanjiDetail()),
];
