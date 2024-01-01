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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(256),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(120),
              ),
              color: Colors.blueAccent,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: BackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: Colors.white,
                      ),
                      child: Hero(
                        tag: image,
                        child: Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44),
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(44),
                            child: Image.network(image),
                          ),
                        ),
                      ),
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
                    Text(
                      phone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri(scheme: 'tel', path: phone));
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text('Call'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await launchUrl(Uri(scheme: 'sms', path: phone));
                    },
                    icon: const Icon(Icons.sms),
                    label: const Text('SMS'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
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
