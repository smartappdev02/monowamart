import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monowamart/constants/app_consntants.dart';
import 'package:monowamart/constants/route_name.dart';
import 'package:monowamart/providers/cart_provider.dart';

class MyBadge {
  static Widget quarterCircle(String title, BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.elliptical(50, 50),
      ),
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(50, 50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  static Widget cart(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (_, cartProvider, __) => badges.Badge(
        position: BadgePosition.topEnd(top: 5, end: 5),
        //animationType: BadgeAnimationType.slide,
        badgeContent: Text(
          cartProvider.getCartItems.length.toString(),
          style: TextStyle(color: Colors.white),
        ),
        showBadge: cartProvider.getCartItems.isEmpty ? false : true,
        badgeStyle: badges.BadgeStyle(
          badgeColor: Theme.of(context).primaryColor,
          shape: BadgeShape.circle,
        ),
        child: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(RouteName.cartScreen),
            icon: Icon(
              mCartIcon,
              color: Colors.black,
            )),
      ),
    );
  }
}
