import 'package:flutter_riverpod/flutter_riverpod.dart';


// 관리하고 싶은 값을 넣어주기
// 어떠한 형태인지 <> 에 명시해주기
final numberProvider = StateProvider<int>((ref) => 0);