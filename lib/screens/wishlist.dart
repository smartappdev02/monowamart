import 'package:flutter/material.dart';
import 'package:monowamart/constants/app_consntants.dart';
import 'package:monowamart/providers/wishlist_provider.dart';
import 'package:monowamart/widgets/empty_wishlist.dart';
import 'package:monowamart/widgets/full_wishlist.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final _wishlistProvider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          if (_wishlistProvider.getwishListItems.isNotEmpty)
            IconButton(
              onPressed: () => _wishlistProvider.clearWishlist(),
              icon: const Icon(mTrashIcon),
              splashRadius: 18,
            ),
        ],
      ),
      body: _wishlistProvider.getwishListItems.isEmpty
          ? EmptyWishlist()
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                children: List.generate(
                  _wishlistProvider.getwishListItems.length,
                  (index) => ChangeNotifierProvider.value(
                      value: _wishlistProvider.getwishListItems.values
                          .toList()[index],
                      child: FullWishlist()),
                ),
              ),
            ),
    );
  }
}
