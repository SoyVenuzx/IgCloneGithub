import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/dp.jpg'))),
              ),
              const Column(
                children: [
                  Text(
                    '30',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Publicaciones')
                ],
              ),
              const Column(
                children: [
                  Text(
                    '130k',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Seguidores')
                ],
              ),
              const Column(
                children: [
                  Text(
                    '109',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Seguidos')
                ],
              )
            ],
          )),
      const SizedBox(
        height: 5,
      ),
      Container(
          margin: const EdgeInsets.only(left: 16),
          child: RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: 'Dev Clips',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            TextSpan(
                text: '\nFlutter Demo\nFlutter\nFlutter Linux',
                style: TextStyle(color: Colors.black87, fontSize: 14)),
          ])))
    ]);
  }
}
