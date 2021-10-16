import 'package:flutter/widgets.dart';
import 'package:shop_app/components/social_card.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          icon: 'assets/icons/google-icon.svg',
          onPressed: () {},
        ),
        SocialCard(
          icon: 'assets/icons/facebook-2.svg',
          onPressed: () {},
        ),
        SocialCard(
          icon: 'assets/icons/twitter.svg',
          onPressed: () {},
        ),
      ],
    );
  }
}
