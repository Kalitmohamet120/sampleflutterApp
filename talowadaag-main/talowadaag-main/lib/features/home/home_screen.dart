import 'package:flutter/material.dart';

import 'package:faker/faker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(252, 0, 47, 252),
        title: const Row(
          children: [
            SizedBox(height: 100),
            Icon(Icons.person, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Mohamed Jamac',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 8),
            // Text(
            //   '${_getGreeting()},',
            //   style: const TextStyle(color: Colors.white),
            // ),
            SizedBox(width: 8),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 20, // Number of fake posts
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FakePost(),
            ),
          );
        },
      ),
    );
  }
}

// String _getGreeting() {
//   var hour = DateTime.now().hour;
//   if (hour < 12) {
//     return 'Good morning';
//   } else if (hour < 18) {
//     return 'Good afternoon';
//   } else {
//     return 'Good evening';
//   }
// }

class FakePost extends StatelessWidget {
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    final personName = faker.person.name();
    final postDate = faker.date.dateTime(minYear: 2021, maxYear: 2024);
    final postTitle = faker.lorem.sentence();
    final postDescription = faker.lorem.sentences(10).join(' ') + '.......';
    final personImage = Image.network(faker.image.image());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: personImage.image,
            ),
            const SizedBox(width: 10),
            Text(
              personName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none, // Remove underline
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${postDate.day}/${postDate.month}/${postDate.year} ${postDate.hour}:${postDate.minute}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                decoration: TextDecoration.none, // Remove underline
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          postTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            decoration: TextDecoration.none, // Remove underline
          ),
        ),
        const SizedBox(height: 10),
        Text(
          postDescription,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: TextDecoration.none, // Remove underline
          ),
        ),
        const Divider(), // Add a divider between posts
      ],
    );
  }
}
