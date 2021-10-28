import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/home/components/custom_btn_with_counter.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/themes/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          CustomBtnWithCounter(
            icone: 'assets/icons/Cart Icon.svg',
            onTap: () {},
          ),
          CustomBtnWithCounter(
            icone: 'assets/icons/Bell.svg',
            onTap: () {},
            count: 6,
          )
        ],
      ),
    );
  }
}
