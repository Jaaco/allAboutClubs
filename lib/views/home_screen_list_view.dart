import 'package:all_about_clubs/providers/club_provider.dart';
import 'package:all_about_clubs/views/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import '../models/club.dart';

class HomeScreenListView extends StatelessWidget {
  const HomeScreenListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClubProvider clubProvider = Provider.of<ClubProvider>(context);
    List<Club> clubs = clubProvider.clubs;
    return clubProvider.noResponse
        ? Center(
            child: Text(
              'no-internet'.i18n(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        : ListView.separated(
            separatorBuilder: ((context, index) => const Divider(
                  color: Colors.black,
                )),
            itemCount: clubs.length,
            itemBuilder: (context, index) => ClubListViewItem(
              club: clubs[index],
            ),
          );
  }
}

class ClubListViewItem extends StatelessWidget {
  final Club club;
  const ClubListViewItem({required this.club, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            club: club,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Image.network(
                club.image,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    club.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    club.country,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    club.value.toString() + ' Millionen',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
