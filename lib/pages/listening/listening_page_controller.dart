import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/pages/listening/listening_model.dart';
import 'package:state_notifier/state_notifier.dart';

final grammerPageProvider =
    StateNotifierProvider<VocabularyListPageController, ListeningModel>((ref) {
  return VocabularyListPageController(widgetRef: ref);
});

class VocabularyListPageController extends StateNotifier<ListeningModel> {
  VocabularyListPageController({required this.widgetRef})
      : super(const ListeningModel());

  final StateNotifierProviderRef widgetRef;
  @override
  ListeningModel get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(grammerPageProvider);
  }

  setSelectedIndex(int index) async {
    state = state.copyWith(selectedCardIndex: index + 1);
  }

  setSearchKey(String key) async {
    // state = state.copyWith(searchKey: key);
  }

  Future<List> getTableAllocationByDate(selectedLocation) async {
    return [];
  }

  // Future<List> readExcelFile(String fileName) async {
  //   var lstN5 = widgetRef.read(n5BoxDataProvider);
  //   await lstN5.box.clear();
  //   var lstData = [];
  //   var filePath = "assets/xl/Vocabulary_of_JLPT_N5.xlsx";
  //   // var byteData = await rootBundle.load(filePath);
  //   // var loc = await localPath;

  //   var file = File(filePath);

  //   // await file.create(recursive: true);

  //   var bytes = file.readAsBytesSync();
  //   var excel = Excel.decodeBytes(bytes);
  //   List<String> rowdetail = [];

  //   for (var table in excel.tables.keys) {
  //     for (var row in excel.tables[table]!.rows) {
  //       rowdetail.add(row.toString());
  //     }
  //   }
  //   // ByteData data =
  //   //     await rootBundle.load("assets/xl/Vocabulary_of_JLPT_N5.xlsx");
  //   // var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //   // var excel = Excel.decodeBytes(bytes);

  //   // for (var i = 0; i < excel.tables["tr2"]!.rows.length; i++) {
  //   //   var row = excel.tables["tr2"]!.rows[i];
  //   //   print(row[0]);
  //   //   // mp[++j] = row;
  //   //   // if ( //row[5] == null ||
  //   //   //     row[1] == null || row[1]!.value.toString().isEmpty) {
  //   //   //   continue;
  //   //   // }

  //   //   var voc = row[0]!.value.toString();
  //   //   var vocMn = row[1] == null ? "" : row[1]!.value.toString();
  //   //   var example = row[2] == null ? "" : row[2]!.value.toString();
  //   //   var exampleTr = row[3] == null ? "" : row[3]!.value.toString();
  //   //   // var kanji = row[4] == null ? "" : row[4]!.value.toString();

  //   //   // var exampleCell = row[2]!.value.toString();
  //   //   // var exampleLst = exampleCell.split("\n");
  //   //   // var exampleSentence =
  //   //   //     exampleLst.length < 2 ? "" : exampleLst[1].split("。")[0];

  //   //   var vocabulary = Dictionary()
  //   //     ..level = 5
  //   //     ..word = voc
  //   //     ..kanji = "kanji"
  //   //     ..translate = vocMn
  //   //     ..example = example
  //   //     ..exampleTr = exampleTr;
  //   //   lstData.add(vocabulary);
  //   //   // lstN5.box.add(person2);
  //   // }
  //   // await lstN5.box.put("N5Grammer", lstData);
  //   return lstData;
  // }
}
