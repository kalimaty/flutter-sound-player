import 'package:flutter/material.dart';
import 'package:sound_player/pages/settimg_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          //homeTitle
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 25,
            ),
            child: ListTile(
              title: Text('H O M E'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          //settingTitle

          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 25,
            ),
            child: ListTile(
              title: Text('S E T T I N G'),
              leading: Icon(
                Icons.settings,
              ),
              onTap: () {
                //pop Drawer
                Navigator.pop(context);
                //navigate to settingPage
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
