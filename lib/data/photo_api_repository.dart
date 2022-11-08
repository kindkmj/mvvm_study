import 'package:image_search/model/photo.dart';

//추상적인 부분이 Domain Layer 의 Repository(interface)
//View Model은 저 interface 에 의해 동작하도록
// Repository 를 구현하고 있는 pixabay_api 는 Data Layer
// 어떤 data를 활용하느냐에 따라서 Data Source 의 개념이 생김
// Pixabay 는 DataSource 는 없는 상태임
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
