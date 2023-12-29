import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:madcamp_week1/models/user.dart';
import 'package:madcamp_week1/screens/contact_detail_screen.dart';

final dio = Dio();

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<List<User>> _fetchUsers() async {
    final result =
        await dio.get<Map<String, dynamic>>('https://dummyjson.com/users');
    return (result.data!['users'] as List)
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final users = snapshot.data!;

        return Scrollbar(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                onTap: () async {
                  await Navigator.push<void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactDetailScreen(
                        name: '${user.firstName} ${user.lastName}',
                        image: user.image,
                        birthDate: user.birthDate,
                        company: user.company.name!,
                        email: user.email,
                        phone: user.phone,
                        address: user.address.address!,
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: users.length,
          ),
        );
      },
    );
  }
}
