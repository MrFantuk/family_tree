import 'package:flutter/material.dart';


class DrawerSection extends StatelessWidget {
  const DrawerSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: const FlutterLogo(),
              ),
              
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text('Мое древо'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.favorite),
                title: const Text('Меню'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text('Настройки'),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}