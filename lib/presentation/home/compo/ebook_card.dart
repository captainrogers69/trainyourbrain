import 'package:flutter/material.dart';
import 'package:trainyourbrain/components/sizing_box.dart';

class EbookCard extends StatelessWidget {
  const EbookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: ListView(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple[600],
              ),
              child: const Center(
                child: Text(
                  'Item 1',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const Sbw(w: 2),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple[600],
              ),
              child: const Center(
                child: Text(
                  'Item 1',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const Sbw(w: 2),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple[600],
              ),
              child: const Center(
                child: Text(
                  'Item 1',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const Sbw(w: 2),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple[600],
              ),
              child: const Center(
                child: Text(
                  'Item 1',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
