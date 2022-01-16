import 'package:flutter/material.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/widget/photo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = PhotoProvider.of(context).homeViewModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Image Search App',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    viewModel.fetch(_controller.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
              stream: viewModel.photoStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final _photos = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: _photos.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index + 1 > _photos.length) {
                        return Container();
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PhotoWidget(
                                photo: _photos[index],
                                api: viewModel.api,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              PhotoWidget(
                                photo: _photos[index + 1],
                                api: viewModel.api,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
