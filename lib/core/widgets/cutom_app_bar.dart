import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_method/core/utils/styles.dart';

AppBar buildAppBar({String? title, required BuildContext context}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      child: Center(child: SvgPicture.asset('assets/images/arrow.svg')),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
