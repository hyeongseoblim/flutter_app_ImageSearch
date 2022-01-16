import 'package:flutter/material.dart';
import 'package:image_search/ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel homeViewModel;
  const PhotoProvider({
    Key? key,
    required Widget child,
    required this.homeViewModel,
  }) : super(key: key, child: child);

  // photo provider 를 어디서든 얻게 하는 of 함수
  // context -> widget tree의 정보를 가지고 있는 객체로, 위젯 트리 정보에서 가장 가까운 프로바이더 반환
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixaBay API');
    return result!;
  }

  // 위젯이 변경이 될 경우 다시 전달해야함, 변경이되는 규칙을 정하는 곳
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
