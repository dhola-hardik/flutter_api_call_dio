import 'dart:collection';
import 'dart:convert';

class Log {
  static void logs(String title, String msg) {
    print('TAG:: $title :: $msg');
  }

  static void loga(String title, var msg) {
    //print('TAG:: $title :: $msg');
    // OR
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(msg)
        .forEach((match) => print('TAG:: $title :: ' + match.group(0)!));
  }

  static void logi(String title, int msg) {
    print('TAG:: $title :: $msg');
  }

  static printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String printPrettyMap(Map mapData) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');

    // display map in alphabetic order
    final sortedData = new SplayTreeMap<String, dynamic>.from(
        mapData, (a, b) => a.compareTo(b));
    String prettyPrint = encoder.convert(sortedData);

    return prettyPrint;
  }
}
