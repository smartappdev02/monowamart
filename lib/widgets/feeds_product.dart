import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monowamart/constants/route_name.dart';
import 'package:monowamart/models/product_model.dart';
import 'package:monowamart/widgets/feeds_dialog.dart';
import 'package:monowamart/widgets/my_button.dart';

class FeedsProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _product = Provider.of<ProductModel>(context, listen: false);
    double _productImageSize = MediaQuery.of(context).size.width * 0.45;
    return Container(
      width: _productImageSize,
      height: _productImageSize + 120,
      child: Material(
        elevation: 0.4,
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () => Navigator.pushNamed(
              context, RouteName.productDetailScreen,
              arguments: _product.id),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                Container(
                  height: _productImageSize,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(_product.images[0]),
                          onError: (object, stacktrace) => {},
                          fit: BoxFit.contain)),
                ),
                badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.deepPurple,
                    shape: BadgeShape.square,
                  ),
                  badgeContent:
                      Text('New', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      _product.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$ ${_product.price.toString()}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sales ${_product.sales}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      MyButton.smallIcon(
                        context: context,
                        icon: Icons.more_vert,
                        color: Theme.of(context).buttonColor,
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => FeedsDialog(
                              productId: _product.id,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
