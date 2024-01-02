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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 192,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120),
                ),
                color: Colors.indigoAccent,
              ),
              child: const Center(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 144,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                color: Colors.white,
                //border: Border.all(color: Colors.blueGrey, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.7),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                child: FutureBuilder<List<User>>(
                  future: _fetchUsers(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final users = snapshot.data!;

                    return Scrollbar(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            _buildContactTile(context, users[index]),
                        itemCount: users.length,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(BuildContext context, User user) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Hero(
                  tag: user.image,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(user.image),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.firstName} ${user.lastName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.phone,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
