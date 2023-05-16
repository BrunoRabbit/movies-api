import 'package:flutter/material.dart';
import 'package:movies_api/features/settings_page/widgets/card_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.height / 26).floorToDouble();
    final height = (MediaQuery.of(context).size.width / 14).floorToDouble();

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Configurações',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          ProfilePicture(width, height),
          SizedBox(
            height: width / 2,
          ),
          CardWidget(
            title: 'Conta do usuário',
            onTap: () {},
          ),
          CardWidget(
            title: 'Idioma',
            onTap: () {},
          ),
          CardWidget(
            title: 'Privacidade e segurança',
            onTap: () {},
          ),
          CardWidget(
            title: 'Suporte e feedback',
            onTap: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(
    this.width,
    this.height, {
    super.key,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 45,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: Color(0xffE3E5E8),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Color(0xff74787F),
            ),
          ),
        ),
      ],
    );
  }
}
