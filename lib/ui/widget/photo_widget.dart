import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  final PixabayApi api;

  const PhotoWidget({
    Key? key,
    required this.photo,
    required this.api,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            photo.previewURL,
          ),
        ),
      ),
    );
  }
}
