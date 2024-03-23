import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';
import 'package:sigma/widgets/button_widget.dart';
import 'package:sigma/widgets/text_form_field_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: width,
        height: height,
        child: ListView(
          children: [
            const SizedBox(height: 80),
            Text(
              'Mi Perfil',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorUtil.primaryAccent,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorUtil.primaryAccent,
                      width: 3.0,
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/doctor_male.png'),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 50,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Material(
                      elevation: 2.0,
                      shape: CircleBorder(),
                      color: Colors.transparent,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: ColorUtil.white,
                        child: Icon(
                          Icons.camera_alt,
                          color: ColorUtil.primaryAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              label: 'Nombre',
              keyboardType: TextInputType.emailAddress,
              isLabelTitle: true,
              hint: 'Ana Smith',
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              isLabelTitle: true,
              hint: 'ana@gmail.com',
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              label: 'Phone',
              keyboardType: TextInputType.emailAddress,
              isLabelTitle: true,
              hint: '+51 908978906',
              onChanged: (value) {},
            ),
            const SizedBox(height: 40),
            ButtonWidget(
              title: 'Atualizar',
              onPressed: () {},
              color: ColorUtil.primaryAccent,
              width: width,
              height: 50,
              isPrincipal: true,
            ),
          ],
        ),
      ),
    );
  }
}
