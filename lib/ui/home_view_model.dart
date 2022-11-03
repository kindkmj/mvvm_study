import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel {
  HomeViewModel(this.api);

  final PixabayApi api;
  final _photoScreamController = StreamController<List<Photo>>()..add([]);

  Stream<List<Photo>> get photoStream => _photoScreamController.stream;

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoScreamController.add(result);
  }
}
