import 'package:flutter/material.dart';
import 'package:image_search/ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel homeViewModel;

  const PhotoProvider({
    Key? key,
    required Widget child,
    required this.homeViewModel,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  //covariant ?? 이름을 바꿔도 된다는 뜻의 키워드
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
