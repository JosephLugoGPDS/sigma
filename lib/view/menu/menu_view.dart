import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';
import 'package:sigma/widgets/dialog_actions_widget.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'MI HOSPITAL XXX',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorUtil.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Bienvenido, Dr. XXXX',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorUtil.gray,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 80),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                children: [
                  MenuCard(
                    title: 'Citas',
                    subtitle: 'Ver citas',
                    body: 'Ver citas 3 eventos',
                    icon: 'assets/splash.png',
                    onPressed: () => Navigator.of(context).pushNamed('/citas'),
                  ),
                  MenuCard(
                    title: 'Perfil',
                    subtitle: 'Ver perfil',
                    body: 'Ver perfil 3 eventos',
                    icon: 'assets/doctor.png',
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/profile'),
                  ),
                  MenuCard(
                      title: 'Cerrar sesión',
                      subtitle: 'Cerrar sesión',
                      body: 'Cerrar sesión 3 eventos',
                      icon: 'assets/scientist.png',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => DialogActionsWidget(
                            description:
                                '¿Estás seguro de que deseas cerrar sesión?',
                            rightTitle: 'Cerrar sesión',
                            rightAction: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/login', (route) => false);
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.subtitle,
    required this.body,
  });
  final String title;
  final String subtitle;
  final String body;
  final String icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 80,
              height: 80,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(body,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorUtil.gray,
                    )),
          ],
        ),
      ),
    );
  }
}
