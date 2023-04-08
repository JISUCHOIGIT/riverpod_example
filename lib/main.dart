import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/layout/screen/home_screen.dart';
import 'package:riverpod_example/riverpod/provider_observer.dart';

void main() {
  // ProviderScope : 상위에 명시해야 riverPod Provier 사용 가능
  runApp(ProviderScope(
    observers: [
      Logger(),
    ],
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
