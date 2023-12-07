
import 'package:flutter_bloc/flutter_bloc.dart';

class TextChangeCubit extends Cubit<String> {

  TextChangeCubit() : super('first text');

  int _currentIndex = -1;

  List<String> texts = [
    'Hello',
    "World",
    "What are",
    "you doing here?",
  ];

  void updateIndex() {
    _currentIndex = _currentIndex + 1;
  }

  void updateText() {
    updateIndex();
    emit(texts[_currentIndex]);
  }

}