import 'package:all_about_clubs/models/club.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class DetailScreen extends StatelessWidget {
  final Club club;
  const DetailScreen({required this.club, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club.name),
      ),
      body: DetailBody(club: club),
    );
  }
}

class DetailBody extends StatelessWidget {
  final Club club;

  const DetailBody({required this.club, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 47, 47, 47),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(
                  40,
                ),
                child: Image.network(
                  club.image,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    club.country,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'the-club'.i18n(),
                  ),
                  TextSpan(
                    text: club.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'worth'.i18n([
                      club.country == 'Niederlande'
                          ? 'den Niederlanden'
                          : club.country,
                      club.value.toString(),
                    ]),
                  ),
                  TextSpan(
                      text: '\n\n${club.name}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: 'wins'.i18n(
                      [
                        club.europeanTitles == 1
                            ? 'one-victory'.i18n()
                            : 'multiple-victories'
                                .i18n([club.europeanTitles.toString()]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
