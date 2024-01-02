import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madcamp_week1/models/user.dart';

final _dio = Dio();

final userQueryProvider = StateProvider((ref) => '');

final usersProvider = FutureProvider.autoDispose((ref) async {
  final query = ref.watch(userQueryProvider);
  final result = await _dio
      .get<Map<String, dynamic>>('https://dummyjson.com/users?limit=0');
  return (result.data!['users'] as List)
      .map((json) => User.fromJson(json as Map<String, dynamic>))
      .where(
        (user) => '${user.firstName} ${user.lastName}'.toLowerCase().contains(
              RegExp(
                query
                    .split(' ')
                    .where((e) => e.isNotEmpty)
                    .join('*')
                    .toLowerCase(),
              ),
            ),
      )
      .toList();
});
