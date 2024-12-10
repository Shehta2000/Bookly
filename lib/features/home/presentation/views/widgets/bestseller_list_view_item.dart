import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class BestSellerListVewItem extends StatelessWidget {
  const BestSellerListVewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.best1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
             Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.5,
                  child: const  Text(
                    'Harry Potter and the Goblet of Fire',
                    style: Styles.textStyle20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
