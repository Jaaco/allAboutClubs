import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/club_provider.dart';
import '../views/home_screen_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('all about clubs'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ClubProvider>(context, listen: false).sortClubs();
            },
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      body: const HomeScreenListView(),
    );
  }
}
