import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

Future<void> main() async {
  //version 1
  // test('Stream이 잘 동작해야 한다.', () async {
  //   //UI에 로직이 들어 있다면 테스트가 안됨
  //   final viewModel = HomeViewModel(PixabayApi());
  //   await viewModel.fetch('apple');
  //   await viewModel.fetch('apple');
  //
  //   //isA = 해당 타입이 들어왔는지 확인하는 것
  //   expect(
  //     viewModel.photoStream,
  //     emitsInOrder([
  //       isA<List<Photo>>(),
  //       isA<List<Photo>>(),
  //     ]),
  //   );
  // });

  //PixabayApi 에 의존을 하고 있는 형태라서
  //api가 잘못된다면 HomeViewModel조차 테스트 할 수 없는 상황임

  //테스트는 의존되는 객체 때문에 결과가 달라지면 안됨
  //의존되지 않게 끔 만들어야함

  //version 2
  test('Stream이 잘 동작해야 한다.', () async {
    //UI에 로직이 들어 있다면 테스트가 안됨
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    await viewModel.fetch('apple');
    await viewModel.fetch('iphon');
    final result2 = result.map((e) => Photo.fromJson(e)).toList();

    //isA = 해당 타입이 들어왔는지 확인하는 것
    expect(
      viewModel.photoStream,
      emitsInOrder([
        equals([]),
        equals(result2),
        equals(result2),
      ]),
    );
  });
}

//version 2
class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> result = [
  {
    'id': 2295434,
    'pageURL':
        "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    'type': "photo",
    'tags': "spring bird, bird, tit",
    'previewURL':
        "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    'previewWidth': 150,
    'previewHeight': 99,
    'webformatURL':
        "https://pixabay.com/get/g2c53906def6bbdde3cd324869cc6a95fc3c6d56d54df1e9def7d0e70d4671ca21c4f3afab2545c446df77710cf9ddcc7b327b235d576fe30a52b71549aeb2d44_640.jpg",
    'webformatWidth': 640,
    'webformatHeight': 426,
    'largeImageURL':
        "https://pixabay.com/get/g2dbba65a9513f4f1bd98062c5200733a244e3d529968fe6161bed93e75d2d113ff473f0bf3dd91fdb8fd9333e731bb11dc173fafdb2a48b73562053bbf5a4877_1280.jpg",
    'imageWidth': 5363,
    'imageHeight': 3575,
    'imageSize': 2938651,
    'views': 559423,
    'downloads': 315949,
    'collections': 1988,
    'likes': 1938,
    'comments': 239,
    'user_id': 334088,
    'user': "JillWellington",
    'userImageURL':
        "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg",
  }
];
