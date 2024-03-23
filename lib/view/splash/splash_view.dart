import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20 + MediaQuery.of(context).padding.top),
            Image.asset('assets/splash.png'),
            Text('HOSPITAL', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 10),
            Text('SOLIDARIDAD',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 30),
            Container(
                alignment: Alignment.center,
                width: width - 80,
                child: Text(
                  'Bienvenido a Sigma App',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorUtil.primary,
                        fontWeight: FontWeight.bold,
                      ),
                )),
            const SizedBox(height: 30),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Agende una cita\n con su médico',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorUtil.gray,
                        fontWeight: FontWeight.bold,
                      ),
                )),
          ],
        ),
      ),
    );
  }
}
