import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/model/photo.dart';
import 'widget/photo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = PhotoProvider.of(context).homeViewModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    await viewModel.fetch(controller.text);
                    // final photos =
                    //     await photoProvider.api.fetch(controller.text);
                    // setState(() {
                    //   _photos = photos;
                    // });
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
              stream: viewModel.photoStream,
              builder: (context, snapshot) {
                if (snapshot.data == null || !snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final photos = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    shrinkWrap: true,
                    itemCount: photos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PhotoWidget(
                        photo: photos[index],
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
