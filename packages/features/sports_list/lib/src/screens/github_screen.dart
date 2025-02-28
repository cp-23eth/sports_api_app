import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubScreen extends StatelessWidget {
  const GithubScreen({super.key});

  Future<void> _launchURL(String witch) async {
    String url;

    if (witch == 'Simon') {
      url = 'https://github.com/Souciss12';
    } else if (witch == 'Ethan') {
      url = 'https://github.com/cp-23eth';
    } else if (witch == 'Quentin') {
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
          'Github',
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
        child: Expanded(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => _launchURL('Simon'),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'packages/component_library/lib/src/assets/images/github_1.jpg'),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => _launchURL('Ethan'),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'packages/component_library/lib/src/assets/images/github_2.jpg'),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => _launchURL('Quentin'),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'packages/component_library/lib/src/assets/images/github_3.jpg'),
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
