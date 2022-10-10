// import 'package:japanese_practise_n5/game/counter/counter_game_page.dart';
// import 'package:japanese_practise_n5/game/master_data/master_data_game_page.dart';
// import 'package:japanese_practise_n5/game/pronoun_game/pronoun_game_page.dart';
// import 'package:japanese_practise_n5/hive_db/object/dictionary.dart';
// // import 'package:japanese_practise_n5/hive_db/object/vocabulary.dart';
// import 'package:japanese_practise_n5/hive_db/provider/n5_box_provider.dart';
// import 'package:japanese_practise_n5/page/master/counter/counter_page.dart';
// import 'package:japanese_practise_n5/page/master/number_day/master_data_page.dart';
// import 'package:japanese_practise_n5/page/pronoun/pronoun_card_page.dart';
// import 'package:excel/excel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_strategy/url_strategy.dart';
// import 'common_page/common_frame.dart';
// import 'common_providers/shared_preferences_provider.dart';
// import 'game/letter_game_page.dart';
// import 'jp_constant/letter/letter_card_page.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   await Hive.initFlutter();
//   // Hive.resetAdapters();
//   Hive.registerAdapter(DictionaryAdapter());
//   setPathUrlStrategy();

//   // runApp(const ProviderScope(child: MyApp()));
//   runApp(ProviderScope(
//     overrides: [
//       n5BoxDataProvider
//           .overrideWithValue(N5Box(await Hive.openBox('N5BoxData'))),
//       sharedPreferencesProvider.overrideWithValue(
//         await SharedPreferences.getInstance(),
//       ),
//     ],
//     child: const CommonFrame(),
//   ));
//   // runApp(const MyApp());
// }
