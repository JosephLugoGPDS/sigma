import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';
import 'package:sigma/widgets/button_widget.dart';
import 'package:sigma/widgets/text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const SizedBox(height: 80),
              Text(
                'Inicie sesión',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorUtil.primaryAccent,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                'Ingrese para gestionar\n sus citas en este hospital',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorUtil.gray,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              TextFormFieldWidget(
                  label: 'Correo electrónico',
                  textEditingController: emailController,
                  keyboardType: TextInputType.emailAddress,
                  isLabelTitle: true,
                  hint: 'Ingrese su correo electrónico',
                  onChanged: (value) {}),
              const SizedBox(height: 30),
              TextFormFieldWidget(
                  label: 'Contraseña',
                  textEditingController: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  isLabelTitle: true,
                  hint: 'Contraseña',
                  obscureText: true,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese su contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                  onChanged: (value) {}),
              const SizedBox(height: 50),
              ButtonWidget(
                title: 'Iniciar sesión',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacementNamed('/menu');
                  }
                },
                color: ColorUtil.primaryAccent,
                width: width,
                height: 50,
                isPrincipal: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
