import 'package:excel/excel.dart';

class XlTestExerciseModel {
  late String question;
  late List<XlTestAnswersModel> answers;
}

class XlTestAnswersModel {
  late String answer;
  late bool isTrue;
}

getCellValue(Data? row) {
  return row == null
      ? ""
      : row.value == null
          ? ""
          : "${row.value}";
}
