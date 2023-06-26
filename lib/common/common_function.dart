import '../main.dart';
import 'common_dialog.dart';

Future speak(String speechText, {String language = "english"}) async {
  String ln = language.contains("japanese") ? "ja-JP" : "en-EN";
  await flutterTts.setVolume(1.0);
  await flutterTts.setSpeechRate(0.8);
  print("ln+$ln");
  flutterTts.setLanguage(ln);
  await flutterTts.setPitch(1);

  if (speechText.isNotEmpty) {
    try {
      await flutterTts.speak(speechText);
    } catch (ex) {
      showErroMessage("speech aldaa", ex.toString());
    }
  }
}
