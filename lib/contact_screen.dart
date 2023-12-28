import 'package:flutter/material.dart';

final contacts = [
  {
    "name": "Henry Mercado",
    "company": "Envire",
    "email": "henrymercado@envire.com",
    "phone": "+1 (854) 479-2531",
    "address": "681 Townsend Street, Galesville, Colorado, 3961",
    "about":
        "Occaecat fugiat labore sit reprehenderit est dolor cupidatat labore culpa. Velit ad duis aliquip minim excepteur laboris magna dolore."
  },
  {
    "name": "Pat Woodward",
    "company": "Fishland",
    "email": "patwoodward@fishland.com",
    "phone": "+1 (943) 404-2696",
    "address": "392 Rockaway Avenue, Tilleda, Montana, 6359",
    "about":
        "Esse mollit cupidatat anim excepteur magna veniam pariatur. Aliquip exercitation velit cillum Lorem fugiat sit pariatur cillum aliquip aliquip."
  },
  {
    "name": "Christie Carson",
    "company": "Exosis",
    "email": "christiecarson@exosis.com",
    "phone": "+1 (911) 513-3802",
    "address": "319 Llama Court, Bowie, Minnesota, 5526",
    "about":
        "Mollit est in fugiat fugiat labore non aliquip do. Laboris adipisicing in ut ipsum quis dolor in."
  },
  {
    "name": "Helga Mcintosh",
    "company": "Namebox",
    "email": "helgamcintosh@namebox.com",
    "phone": "+1 (880) 437-3281",
    "address": "403 Lancaster Avenue, Bath, South Dakota, 1751",
    "about":
        "Ad eu aliquip nulla nostrud qui esse est pariatur id dolore quis irure. Ipsum labore nisi deserunt culpa tempor."
  },
  {
    "name": "Freida Lowery",
    "company": "Anocha",
    "email": "freidalowery@anocha.com",
    "phone": "+1 (900) 566-3419",
    "address": "231 Folsom Place, Vaughn, Louisiana, 8041",
    "about":
        "Sit et excepteur dolor irure deserunt laborum dolore sit. Cillum culpa consectetur ea aute dolore amet."
  },
  {
    "name": "Hurley Mcguire",
    "company": "Limage",
    "email": "hurleymcguire@limage.com",
    "phone": "+1 (968) 596-2171",
    "address": "570 Kingsway Place, Tuttle, Alabama, 7434",
    "about":
        "Non ullamco occaecat nostrud proident dolor eiusmod non qui mollit. Consectetur elit sunt consectetur nisi consectetur pariatur."
  },
  {
    "name": "Morin Jacobson",
    "company": "Hivedom",
    "email": "morinjacobson@hivedom.com",
    "phone": "+1 (952) 468-3197",
    "address": "713 Kingston Avenue, Moquino, Rhode Island, 5308",
    "about": "Labore ipsum ex nulla tempor. Deserunt dolore et amet amet."
  },
  {
    "name": "Gross Massey",
    "company": "Zentry",
    "email": "grossmassey@zentry.com",
    "phone": "+1 (834) 549-3627",
    "address": "610 Kathleen Court, Sardis, Georgia, 2032",
    "about":
        "Adipisicing eu cupidatat tempor amet in elit fugiat velit. Cupidatat ex commodo ea laboris excepteur et anim laboris amet."
  },
  {
    "name": "Iva Riggs",
    "company": "Geekola",
    "email": "ivariggs@geekola.com",
    "phone": "+1 (985) 533-2955",
    "address": "287 Fiske Place, Bethpage, Maryland, 111",
    "about":
        "Sit voluptate mollit proident aliqua est pariatur consectetur minim ea veniam velit. Deserunt proident est commodo minim duis cupidatat irure non proident ad amet consectetur."
  },
  {
    "name": "Gena Henson",
    "company": "Comveyer",
    "email": "genahenson@comveyer.com",
    "phone": "+1 (975) 402-2538",
    "address": "744 Noll Street, Marne, Washington, 5243",
    "about":
        "Aliqua minim non sint exercitation do qui ea proident voluptate qui. In eiusmod labore adipisicing ipsum fugiat excepteur pariatur non dolor veniam non consequat elit sit."
  }
];

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final item = contacts[index % 10];

          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(item["name"]!),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailScreen(
                      name: item["name"]!,
                      company: item["company"]!,
                      email: item["email"]!,
                      phone: item["phone"]!,
                      address: item["address"]!,
                      about: item["about"]!,
                    ),
                  ));
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1.0),
        itemCount: contacts.length * 10,
      ),
    );
  }
}

class ContactDetailScreen extends StatelessWidget {
  final String name;
  final String company;
  final String email;
  final String phone;
  final String address;
  final String about;

  const ContactDetailScreen(
      {super.key,
      required this.name,
      required this.company,
      required this.email,
      required this.phone,
      required this.address,
      required this.about});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 64.0,
              child: Icon(
                Icons.person,
                size: 96.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            Text(
              phone,
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 32.0),
            _buildItem('Company', company),
            const SizedBox(height: 4.0),
            _buildItem('Email', email),
            const SizedBox(height: 4.0),
            _buildItem('Address', address),
            const Divider(height: 32.0),
            Text(
              about,
              style: const TextStyle(fontSize: 14.0),
            ),
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
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16.0),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
