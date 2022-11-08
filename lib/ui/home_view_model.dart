import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  //UnmodifiableListView 내부 데이터 수정 못하게 막음 단순히 get만으로는 안됨
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repository);

  List<Photo> _photos = [];

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
