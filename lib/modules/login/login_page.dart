import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.36,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 0.75,
                  colors: [
                    AppColors.gradient,
                    AppColors.primary,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0.0,
              right: 0.0,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 300,
              ),
            ),
            Positioned(
              top: 250,
              left: 0.0,
              right: 0.0,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.background, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, 0, 90));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  height: 90,
                  width: 100,
                  color: AppColors.background,
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: size.height * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 70,
                      right: 70,
                    ),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 40,
                    ),
                    child: SocialLoginButton(
                      onTap: () {
                        controller.googleSignIn(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
