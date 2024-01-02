import 'package:flutter/material.dart';
import 'package:madcamp_week1/widgets/custom_scaffold.dart';
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
    return CustomScaffold(
      title: _buildTitle(context),
      height: 300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLaunchButton(const Icon(Icons.phone), 'tel', phone),
                const SizedBox(width: 24),
                _buildLaunchButton(const Icon(Icons.sms), 'sms', phone),
                const SizedBox(width: 24),
                _buildLaunchButton(const Icon(Icons.email), 'mailto', email),
              ],
            ),
            const SizedBox(height: 16),
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

  Widget _buildLaunchButton(Widget icon, String scheme, String path) {
    return Material(
      type: MaterialType.circle,
      elevation: 3,
      color: Colors.blueGrey,
      shadowColor: Colors.blueGrey.withOpacity(0.7),
      child: IconButton.filled(
        padding: const EdgeInsets.all(12),
        onPressed: () async {
          await launchUrl(Uri(scheme: scheme, path: path));
        },
        icon: icon,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
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
                color: Theme.of(context).colorScheme.primaryContainer,
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
            color: Colors.black87,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          phone,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
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
