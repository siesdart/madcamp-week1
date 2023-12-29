import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String birthDate;
  final String company;
  final String email;
  final String phone;
  final String address;

  const ContactDetailScreen({
    required this.name,
    required this.image,
    required this.birthDate,
    required this.company,
    required this.email,
    required this.phone,
    required this.address,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              phone,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri(scheme: 'tel', path: phone));
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text('Call'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri(scheme: 'sms', path: phone));
                    },
                    icon: const Icon(Icons.sms),
                    label: const Text('SMS'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri(scheme: 'mailto', path: email));
                    },
                    icon: const Icon(Icons.email),
                    label: const Text('Email'),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildItem('Birth', birthDate),
            const SizedBox(height: 4),
            _buildItem('Email', email),
            const SizedBox(height: 4),
            _buildItem('Address', address),
            const SizedBox(height: 4),
            _buildItem('Company', company),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String type, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
