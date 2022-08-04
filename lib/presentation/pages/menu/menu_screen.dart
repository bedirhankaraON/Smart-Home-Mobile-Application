import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartix/core/app_core.dart';
import 'package:smartix/presentation/widgets/common/error_info_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Menu',
                        style: TextStyle(color: ThemeColors.primary, fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      GestureDetector(
                        child: const Icon(
                          CupertinoIcons.multiply,
                          color: ThemeColors.primary,
                          size: 45,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MenuItem(
                    title: 'Devices',
                    icon: CupertinoIcons.circle_grid_hex,
                    onTap: () => Navigator.pushNamed(context, 'devices'),
                  ),
                  MenuItem(
                    title: 'Routines',
                    icon: CupertinoIcons.sparkles,
                    onTap: () => Navigator.pushNamed(context, 'routines'),
                  ),
                  MenuItem(
                    title: 'Settings',
                    icon: CupertinoIcons.gear,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) =>
                          const ErrorInfoWidget(title: 'Error', subtitle: 'The page is not implemented yet'),
                    ),
                  ),
                  MenuItem(
                    title: 'Logout',
                    icon: CupertinoIcons.back,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) =>
                          const ErrorInfoWidget(title: 'Error', subtitle: 'The page is not implemented yet'),
                    ),
                  ),
                ],
              ),
              Image.network(
                'https://smart-ix.ai/images/video-bg-2400.png',
                height: 350,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.title, required this.icon, this.iconSize, this.onTap}) : super(key: key);
  final String title;
  final IconData icon;
  final Function()? onTap;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(color: ThemeColors.primary, fontWeight: FontWeight.normal, fontSize: 22),
      ),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.primary),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          icon,
          size: iconSize ?? 25,
          color: ThemeColors.primary,
        ),
      ),
    );
  }
}
