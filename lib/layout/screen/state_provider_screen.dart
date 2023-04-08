import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/layout/default_layout.dart';
import 'package:riverpod_example/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  // WidgetRef ref 선언해주기
  Widget build(BuildContext context, WidgetRef ref) {
    // read, watch, listen
    // watch : 무언가를 바라보다가 변경 된 경우 재빌드 하게 해주는 역할
    // riverpod/StateProvider<int>((ref) => 0);
    // 직접적 Ui 변경은 watch
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    // 무언가를 버튼을 누르고 실행되는 경우 : read
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: Text('up')),
              ElevatedButton(
                  onPressed: () {
                    // 무언가를 버튼을 누르고 실행되는 경우 : read
                    ref
                        .read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state - 1;
                  },
                  child: Text('down')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => _NextScreen(),
                    ));
                  },
                  child: Text('NextScreen')),
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    // 무언가를 버튼을 누르고 실행되는 경우 : read
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: Text('up')),
            ],
          ),
        ));
  }
}
