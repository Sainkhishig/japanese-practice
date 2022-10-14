import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:japanese_practise_n5/pages/kanji/detail/kanji_detail.dart';
import 'package:japanese_practise_n5/pages/kanji/list/kanji_state.dart';
import 'package:japanese_practise_n5/pages/kanji/model/kanji_model.dart';

final kanjiDetailController =
    StateNotifierProvider<KanjiDetailController, KanjiState>(
        (ref) => KanjiDetailController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class KanjiDetailController extends StateNotifier<KanjiState> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  KanjiDetailController({required this.ref}) : super(const KanjiState());
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  KanjiState? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  clearState() => state = const KanjiState();

  Future<KanjiState?> getCancellationPolicyDetail(String uniqueId) async {
    // final response = await ref
    //     .read(facilityApiProvider)
    //     .gqlGetCancellationPolicyDetail(uniqueId);

    // if (response == null) return null;
    // state = response;

    return state;
  }

  //#endregion ---------- facility ----------
  //#region ---------- save ----------
  Future<bool> save(KanjiModel detail) async {
    try {
      String query = r'''
         mutation saveFacilityPlan($facilityId:ID!,$input: FacilityPlanInput) {
          saveFacilityPlan: saveFacilityPlan(facilityId:$facilityId,
          input: $input
          ) {
            id
        facilityId
        checkInStartTime
        lastModifiedDate
          }
        }
      ''';

      // final response = await GraphqlClient().executeMutationByOption(options);

      return true;
    } catch (e) {
      // TODO: INTERNAL_ERROR, NOT_FOUND
      print(e);
      return false;
    }
  }

  void update() {
    var _todoQuery = _database.child("/rKanji");
    _todoQuery.child("/-MqqasF6kB1Bszz3TtvU").set({
      'age': '29',
      'email': 'updari.ariuka67@gmail.com',
      'mobile': '07083539202',
      'name': 'Sainkhishig Ariunaa',
      'time': DateTime.now().microsecondsSinceEpoch
    });
  }

  void writeNew(String exerciseName, List<KanjiDetailItem> lstExercises,
      List<String> vocabularies) {
    List<KanjiModel> lstKanjiExercises = [];
    for (var kanjiEx in lstExercises) {
      var name = kanjiEx.txtName.controller.text;
      var content = kanjiEx.txtContent.controller.text;
      var question = kanjiEx.txtQuestion.controller.text;
      var answer = kanjiEx.txtAnswer.controller.text;
      List<String> answers = kanjiEx.lstAnswerChoiceWidget.lstAnswer
          .map((e) => e.field.controller.text)
          .toList();

      KanjiModel kanji =
          KanjiModel(name, content, question, answers, answer, DateTime.now());
      lstKanjiExercises.add(kanji);
    }

    List<Map<String, dynamic>> lstSendItem = [];
    lstKanjiExercises.map((e) {
      lstSendItem.add({
        'content': e.content,
        'question': e.question,
        'answer': e.answer,
        'answers': e.answers.map((e) => {"name": e}).toList(),
      });
    }).toList();

    final newData = <String, dynamic>{
      'name': exerciseName,
      'exercises': lstSendItem,
      'vocabularies': vocabularies.map((e) => {"word": e}).toList(),
      'time': DateTime.now().microsecondsSinceEpoch
    };
    _database
        .child('KanjiExercises')
        .push()
        .set(newData)
        .then((value) => {
              print('new data written'),
            })
        .catchError((onError) {
      print('could not saved data');
    });
  }

  void write(KanjiModel detail) {
    // var _todoQuery = _database.child("/rKanji");
    List<Map<String, dynamic>> lstExample = [];
    // bool responseSuccess = false;
    detail.answers.map((e) => lstExample.add({"name": e})).toList();

    final newData = <String, dynamic>{
      'content': detail.content,
      'question': detail.question,
      'answer': detail.answer,
      'answers': lstExample,
      'time': DateTime.now().microsecondsSinceEpoch
    };
    _database
        .child('rKanji')
        .push()
        .set(newData)
        .then((value) => {
              print('new data written'),
            })
        .catchError((onError) => print('could not saved data'));
  }

  // void write(KanjiModel detail) {
  //   // var _todoQuery = _database.child("/rKanji");
  //   _database.child('counter').once().then((DataSnapshot snapshot) {
  //     print('Connected to second database and read ${snapshot.value}');
  //     var count = snapshot.value;
  //     final newData = <String, dynamic>{
  //       'code': detail.code,
  //       'name': detail.name,
  //       'time': DateTime.now().microsecondsSinceEpoch
  //     };
  //     _database
  //         .child('rKanji')
  //         .push()
  //         .set(newData)
  //         .then((value) =>
  //             {print('new data written'), updateCounter(int.parse(count))})
  //         .catchError((onError) => print('could not saved data'));
  //   });

  //   // var _todoQuery = _database.child("/user1");
  //   // _todoQuery.child("/-MqqasF6kB1Bszz3TtvU").set({
  //   //   'age': '29',
  //   //   'email': 'ari.ariuka67@gmail.com',
  //   //   'mobile': '07083539202',
  //   //   'name': 'Sainkhishig Ariunaa'
  //   // });
  // }

  // void writeData() async {
  //   // Please replace the Database URL
  //   // which we will get in “Add Realtime
  //   // Database” step with DatabaseURL
  //   var url =
  //       "https://afen-japanese-default-rtdb.firebaseio.com/" + "data.json";

  //   // (Do not remove “data.json”,keep it as it is)
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: json.encode({"title": "123"}),
  //     );
  //   } catch (error) {
  //     throw error;
  //   }
  // }

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
