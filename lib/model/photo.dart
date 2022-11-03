/// id : 2295434
/// pageURL : "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/"
/// type : "photo"
/// tags : "spring bird, bird, tit"
/// previewURL : "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg"
/// previewWidth : 150
/// previewHeight : 99
/// webformatURL : "https://pixabay.com/get/g2c53906def6bbdde3cd324869cc6a95fc3c6d56d54df1e9def7d0e70d4671ca21c4f3afab2545c446df77710cf9ddcc7b327b235d576fe30a52b71549aeb2d44_640.jpg"
/// webformatWidth : 640
/// webformatHeight : 426
/// largeImageURL : "https://pixabay.com/get/g2dbba65a9513f4f1bd98062c5200733a244e3d529968fe6161bed93e75d2d113ff473f0bf3dd91fdb8fd9333e731bb11dc173fafdb2a48b73562053bbf5a4877_1280.jpg"
/// imageWidth : 5363
/// imageHeight : 3575
/// imageSize : 2938651
/// views : 559423
/// downloads : 315949
/// collections : 1988
/// likes : 1938
/// comments : 239
/// user_id : 334088
/// user : "JillWellington"
/// userImageURL : "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
class Photo {
  Photo({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  late final int id;
  late final String pageURL;
  late final String type;
  late final String tags;
  late final String previewURL;
  late final int previewWidth;
  late final int previewHeight;
  late final String webformatURL;
  late final int webformatWidth;
  late final int webformatHeight;
  late final String largeImageURL;
  late final int imageWidth;
  late final int imageHeight;
  late final int imageSize;
  late final int views;
  late final int downloads;
  late final int collections;
  late final int likes;
  late final int comments;
  late final int userId;
  late final String user;
  late final String userImageURL;

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageURL = json['pageURL'];
    type = json['type'];
    tags = json['tags'];
    previewURL = json['previewURL'];
    previewWidth = json['previewWidth'];
    previewHeight = json['previewHeight'];
    webformatURL = json['webformatURL'];
    webformatWidth = json['webformatWidth'];
    webformatHeight = json['webformatHeight'];
    largeImageURL = json['largeImageURL'];
    imageWidth = json['imageWidth'];
    imageHeight = json['imageHeight'];
    imageSize = json['imageSize'];
    views = json['views'];
    downloads = json['downloads'];
    collections = json['collections'];
    likes = json['likes'];
    comments = json['comments'];
    userId = json['user_id'];
    user = json['user'];
    userImageURL = json['userImageURL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pageURL'] = pageURL;
    _data['type'] = type;
    _data['tags'] = tags;
    _data['previewURL'] = previewURL;
    _data['previewWidth'] = previewWidth;
    _data['previewHeight'] = previewHeight;
    _data['webformatURL'] = webformatURL;
    _data['webformatWidth'] = webformatWidth;
    _data['webformatHeight'] = webformatHeight;
    _data['largeImageURL'] = largeImageURL;
    _data['imageWidth'] = imageWidth;
    _data['imageHeight'] = imageHeight;
    _data['imageSize'] = imageSize;
    _data['views'] = views;
    _data['downloads'] = downloads;
    _data['collections'] = collections;
    _data['likes'] = likes;
    _data['comments'] = comments;
    _data['user_id'] = userId;
    _data['user'] = user;
    _data['userImageURL'] = userImageURL;
    return _data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Photo{id: $id}';
  }
}
