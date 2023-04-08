import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/layout/default_layout.dart';
import 'package:riverpod_example/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initState 안에서는 watch 금지 => read만
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    // listen을 통해서 값이 변화가 될때마다 controller를 실행할 수 있음
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
    });

    return DefaultLayout(
        title: 'ListenProviderScreen',
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: List.generate(
              10,
              (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(index.toString()),
                      ElevatedButton(
                          onPressed: () {
                            ref.read(listenProvider.notifier).update(
                                (state) => state == 10 ? 10 : state + 1);
                          },
                          child: Text('다음')),
                      ElevatedButton(
                          onPressed: () {
                            ref
                                .read(listenProvider.notifier)
                                .update((state) => state == 0 ? 0 : state - 1);
                          },
                          child: Text('뒤로')),
                    ],
                  )),
        ));
  }
}
