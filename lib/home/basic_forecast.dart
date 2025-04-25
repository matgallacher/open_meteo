import 'package:flutter/material.dart';
import 'package:open_meteo/home/forecast_detail_card.dart';

class BasicForecast extends StatelessWidget {
  final double temperature;
  final String temperatureUnits;
  final int precipitation;
  final String precipitationUnits;
  final double uvIndex;
  final double? pollenCount;
  final double airQuality;
  final bool isDaytime;
  final VoidCallback? onMoreDetails;

  const BasicForecast({
    super.key,
    required this.temperature,
    required this.temperatureUnits,
    required this.precipitation,
    required this.precipitationUnits,
    required this.uvIndex,
    required this.pollenCount,
    required this.airQuality,
    required this.isDaytime,
    this.onMoreDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.list(
          children: [
            Icon(isDaytime ? Icons.wb_sunny : Icons.nights_stay, size: 48),
            Text(
              '${temperature.toInt()}$temperatureUnits',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              ForecastDetailCard(
                title: 'Precipitation',
                value: precipitation,
                units: precipitationUnits,
                icon: Icon(Icons.water_drop),
              ),
              ForecastDetailCard(
                title: 'UV Index',
                value: uvIndex,
                icon: Icon(Icons.sunny),
              ),
              if (pollenCount != null)
                ForecastDetailCard(
                  title: 'Pollen Count',
                  value: pollenCount!,
                  icon: Icon(Icons.grass),
                ),
              ForecastDetailCard(
                title: 'Air Quality',
                value: airQuality,
                icon: Icon(Icons.water),
              ),
            ],
          ),
        ),
        if (onMoreDetails != null)
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onMoreDetails,
                child: Text('More Details'),
              ),
            ),
          ),
      ],
    );
  }
}
