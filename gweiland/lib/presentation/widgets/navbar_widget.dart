import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/assets.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      decoration: const BoxDecoration(
        color: Color(0xff0B0B0B),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.faceIcon,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "€-\$hop",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.exchangeIcon,
                  width: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Exchange",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
            Image.asset(
              Assets.earthIcon,
              height: 53,
              width: 53,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.launchIcon,
                  width: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Launchpads",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.walletIcon,
                  width: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Wallet",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
