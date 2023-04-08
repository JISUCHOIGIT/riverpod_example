import 'package:flutter/material.dart';
import 'package:riverpod_example/layout/default_layout.dart';
import 'package:riverpod_example/layout/screen/auto_modifier_provider_screen.dart';
import 'package:riverpod_example/layout/screen/family_modfier_provider_screen.dart';
import 'package:riverpod_example/layout/screen/future_provider_screen.dart';
import 'package:riverpod_example/layout/screen/listen_provider_screen.dart';
import 'package:riverpod_example/layout/screen/provider_screen.dart';
import 'package:riverpod_example/layout/screen/select_provider_screen.dart';
import 'package:riverpod_example/layout/screen/state_notifier_provider_screen.dart';
import 'package:riverpod_example/layout/screen/state_provider_screen.dart';
import 'package:riverpod_example/layout/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'Home Screen',
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StateProviderScreen(),
                  ));
                },
                child: Text('StateProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StateNotifierProviderScreen(),
                  ));
                },
                child: Text('StateNotifierProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FutureProviderScreen(),
                  ));
                },
                child: Text('FutureProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FamilyModifierScreen(),
                  ));
                },
                child: Text('FamilyModifierScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AutoModifierScreen(),
                  ));
                },
                child: Text('AutoModifierScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ListenProviderScreen(),
                  ));
                },
                child: Text('ListenProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SelectProviderScreen(),
                  ));
                },
                child: Text('SelectProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProviderScreen(),
                  ));
                },
                child: Text('ProviderScreen')),
          ],
        ));
  }
}
