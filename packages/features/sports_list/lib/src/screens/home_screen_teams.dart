import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sports_list/sports_list.dart';

class HomeScreenTeams extends StatefulWidget {
  const HomeScreenTeams({super.key});

  @override
  State<HomeScreenTeams> createState() => _HomeScreenTeamsState();
}

class _HomeScreenTeamsState extends State<HomeScreenTeams> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<SportsListProvider>().state;

    Widget buildSection(String title, List<Widget> subSections) {
      return ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        children: subSections,
      );
    }

    Widget buildSubSection(
        String subTitle, int startIndex, int endIndex, SportsListState state) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ExpansionTile(
          title: Text(
            subTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          children: List.generate(endIndex - startIndex + 1, (index) {
            return SizedBox(
              height: 90,
              child: TeamList(
                team: context
                    .read<SportsListProvider>()
                    .state
                    .teams[startIndex + index],
                players: state.players,
              ),
            );
          }),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Header(),
        Expanded(
          child: ListView(
            children: [
              buildSection('EAST', [
                buildSubSection('Atlantic', 5, 9, state),
                buildSubSection('Central', 10, 14, state),
                buildSubSection('South East', 0, 4, state),
              ]),
              buildSection('WEST', [
                buildSubSection('North West', 15, 19, state),
                buildSubSection('Pacific', 25, 29, state),
                buildSubSection('South West', 20, 24, state),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
