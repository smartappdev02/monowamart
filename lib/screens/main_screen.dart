import 'package:flutter/material.dart';
import 'package:monowamart/providers/auth_provider.dart';
import 'package:monowamart/providers/product_provider.dart';
import 'package:monowamart/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 1);

    final _authProvider = Provider.of<AuthProvider>(context);
    _authProvider.signInAnonymously();

    final _productsProvider = Provider.of<ProductProvider>(context);
    _productsProvider.fetchProducts();

    return PageView(
      controller: controller,
      children: <Widget>[BottomBarScreen()],
    );
  }
}
