import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:url_launcher/url_launcher.dart';

class NbaImageScreen extends StatelessWidget {
  const NbaImageScreen({super.key});

  Future<void> _launchURL(String user) async {
    String url;

    if (user == 'Simon') {
      url = 'https://github.com/Souciss12';
    } else if (user == 'Ethan') {
      url = 'https://github.com/cp-23eth';
    } else if (user == 'Quentin') {
      url = 'https://github.com/MafilleQuentin';
    } else {
      url = 'https://github.com/';
    }
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Développeurs : ',
          style: TextStyle(
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        iconTheme:
            ThemeData.estimateBrightnessForColor(Parameter.backgroundColor) ==
                    Brightness.light
                ? const IconThemeData(color: Colors.black)
                : const IconThemeData(color: Colors.white),
        backgroundColor: Parameter.backgroundColor,
      ),
      backgroundColor: Parameter.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _launchURL('Simon'),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'packages/component_library/lib/src/assets/images/dev_images/github_1.jpg'),
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Simon Golay',
                      style: TextStyle(
                        fontSize: 20,
                        color: ThemeData.estimateBrightnessForColor(
                                    Parameter.backgroundColor) ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _launchURL('Ethan'),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'packages/component_library/lib/src/assets/images/dev_images/github_2.jpg'),
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ethan Hofstetter',
                      style: TextStyle(
                        fontSize: 20,
                        color: ThemeData.estimateBrightnessForColor(
                                    Parameter.backgroundColor) ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _launchURL('Quentin'),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'packages/component_library/lib/src/assets/images/dev_images/github_3.jpg'),
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Quentin Mafille',
                      style: TextStyle(
                        fontSize: 20,
                        color: ThemeData.estimateBrightnessForColor(
                                    Parameter.backgroundColor) ==
                                Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
