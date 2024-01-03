import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madcamp_week1/models/user.dart';
import 'package:madcamp_week1/providers/user.dart';
import 'package:madcamp_week1/screens/contact_detail_screen.dart';
import 'package:madcamp_week1/widgets/contact_tile.dart';
import 'package:madcamp_week1/widgets/custom_scaffold.dart';
import 'package:madcamp_week1/widgets/custom_text_field.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: const Text('Contacts'),
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.7),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          child: Consumer(
            builder: (context, ref, _) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomTextField(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(28),
                      bottom: Radius.circular(16),
                    ),
                    hintText: 'Search...',
                    onChanged: (text) =>
                        ref.read(userQueryProvider.notifier).state = text,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: switch (ref.watch(usersProvider)) {
                    AsyncData(:final value) => ListView.builder(
                        itemBuilder: (context, index) => ContactTile(
                          user: value[index],
                          onPressed: (user) => _onTilePressed(context, user),
                        ),
                        itemCount: value.length,
                      ),
                    _ => const Center(child: CircularProgressIndicator()),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTilePressed(BuildContext context, User user) async {
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
  }
}
