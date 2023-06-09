import 'package:flutter/material.dart';
import 'package:monowamart/constants/route_name.dart';
import 'package:monowamart/models/category_model.dart';

class Category extends StatelessWidget {
  final CategoryModel category;

  Category({required this.category});

  @override
  Widget build(BuildContext context) {
    double _imageSize = 50;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteName.categoryScreen,
          arguments: category.title),
      child: SizedBox(
        width: _imageSize + 15,
        child: Column(
          children: [
            Container(
              height: _imageSize,
              width: _imageSize,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.deepPurple[50],
              ),
              child: Center(
                child: Image.asset(
                  category.image,
                  width: _imageSize * 0.65,
                  height: _imageSize * 0.65,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              category.title,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
