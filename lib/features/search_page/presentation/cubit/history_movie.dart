import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryMovieCubit extends Cubit<List<String>> {
  HistoryMovieCubit() : super([]);

  String historyKey = 'historySearch';
  SharedPreferences prefs = GetIt.instance.get<SharedPreferences>();

  void addMovie(String value) async {
    if (prefs.containsKey(historyKey)) {
      List<String> historyList = prefs.getStringList(historyKey)!;
      historyList.add(value);

      await prefs.setStringList(historyKey, historyList);
      emit(historyList);
    } else {
      await prefs.setStringList(historyKey, [value]);
      List<String> historyList = prefs.getStringList(historyKey)!;
      emit(historyList);
    }
  }

  void removeSuggestion(String option) async {
    if (prefs.containsKey(historyKey)) {
      List<String> historyList = prefs.getStringList(historyKey)!;
      historyList.remove(option);
      await prefs.setStringList(historyKey, historyList);
      emit(historyList);
    }
  }
}
