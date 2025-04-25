import 'package:flutter/material.dart';

class ForecastDetailCard extends StatelessWidget {
  final String title;
  final num value;
  final String? units;
  final Widget icon;

  const ForecastDetailCard({
    super.key,
    required this.title,
    required this.value,
    this.units,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelMedium),
            IconTheme(data: IconThemeData(size: 32), child: icon),
            Text(
              (units ?? '').isNotEmpty ? '$value $units' : value.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
