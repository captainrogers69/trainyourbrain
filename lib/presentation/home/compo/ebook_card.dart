import 'package:flutter/material.dart';
import 'package:trainyourbrain/domain/models/data_models/ebook_model.dart';

import '../../../components/k_cache_image.dart';
import '../../../data/data_images.dart';
import '../../../utils/responsive/size_config.dart';

class EbookCard extends StatelessWidget {
  final EbookItem ebook;
  const EbookCard({required this.ebook, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: size.width * .40,
        decoration: BoxDecoration(
          color: Colors.purple[600],
        ),
        child: Center(
          child: KCacheImage(
            image: dataCover,
            width: size.width * .6,
            height: 198,
            fit: BoxFit.fill,
            roundCorner: 1,
          ),
        ),
      ),
    );
  }
}
