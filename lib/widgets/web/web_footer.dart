import 'package:flutter/material.dart';
import 'package:google_clone_app/colors.dart';
import 'package:google_clone_app/widgets/footer_text.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      padding: const EdgeInsets.all(5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FooterText(title: 'About'),
              SizedBox(
                width: 10,
              ),
              FooterText(title: 'Advertising'),
              SizedBox(
                width: 10,
              ),
              FooterText(title: 'Business'),
              SizedBox(
                width: 10,
              ),
              FooterText(title: 'How Search Works'),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FooterText(title: 'Privacy'),
              SizedBox(
                width: 10,
              ),
              FooterText(title: 'Terms'),
              SizedBox(
                width: 10,
              ),
              FooterText(title: 'Settings'),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
