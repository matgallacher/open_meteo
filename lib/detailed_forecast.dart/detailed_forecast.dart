import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_meteo/detailed_forecast.dart/detailed_forecast_dependencies.dart';

class DetailedForecast extends StatefulWidget {
  const DetailedForecast({super.key});

  @override
  State<DetailedForecast> createState() => _DetailedForecastState();
}

class _DetailedForecastState extends State<DetailedForecast> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final deps = DetailedForecastDependencies.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(deps.location.name)),
      body: Column(
        spacing: 16,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: SegmentedButton(
              segments: [
                ButtonSegment(
                  value: 0,
                  label: Text('Hourly'),
                  icon: Icon(Icons.access_time),
                ),
                ButtonSegment(
                  value: 1,
                  label: Text('7 Day'),
                  icon: Icon(Icons.calendar_today),
                ),
              ],
              selected: {_selected},
              onSelectionChanged:
                  (value) => setState(() => _selected = value.first),
            ),
          ),
          if (_selected == 0)
            FutureBuilder(
              future: deps.fetchHourlyForecast(),
              builder: (context, forecast) {
                if (forecast.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (forecast.hasError || forecast.data == null) {
                  return const Center(
                    child: Text('Error fetching hourly forecast'),
                  );
                }

                return SizedBox(
                  height: 320,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: forecast.data!.data.time.length,
                    itemBuilder: (context, index) {
                      final date = forecast.data!.data.time[index];
                      final temp = forecast.data!.data.temperature2M[index];
                      final wind = forecast.data!.data.windSpeed10M[index];
                      final cloud = forecast.data!.data.cloudCover[index];
                      final visibility = forecast.data!.data.visibility[index];
                      final precipitation =
                          forecast.data!.data.precipitationProbability[index];
                      final isDay = forecast.data!.data.isDay[index] == 1;
                      return SizedBox(
                        width: 120,
                        child: Card.filled(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 4,
                            ),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Icon(
                                  isDay ? Icons.wb_sunny : Icons.nights_stay,
                                  size: 32,
                                ),
                                Text(
                                  '$temp${forecast.data!.units.temperature2M}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 8),
                                WeatherDetail(
                                  icon: Icon(Icons.water_drop),
                                  value: precipitation,
                                  unit:
                                      forecast
                                          .data!
                                          .units
                                          .precipitationProbability,
                                ),
                                WeatherDetail(
                                  icon: Icon(Icons.air),
                                  value: wind,
                                  unit: forecast.data!.units.windSpeed10M,
                                ),
                                SizedBox(height: 8),
                                WeatherDetail(
                                  icon: Icon(Icons.cloud),
                                  value: cloud,
                                  unit: forecast.data!.units.cloudCover,
                                ),
                                SizedBox(height: 8),
                                WeatherDetail(
                                  icon: Icon(Icons.visibility),
                                  value: (visibility / 1000).toInt(),
                                  unit: 'km',
                                ),
                                SizedBox(height: 16),
                                Text(
                                  DateFormat.Hm().format(date),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 4),
                  ),
                );
              },
            )
          else
            FutureBuilder(
              future: deps.fetch7DayForecast(),
              builder: (context, forecast) {
                if (forecast.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (forecast.hasError || forecast.data == null) {
                  return const Center(
                    child: Text('Error fetching 7 day forecast'),
                  );
                }

                return SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: forecast.data!.data.time.length,
                    itemBuilder: (context, index) {
                      final date = forecast.data!.data.time[index];
                      final temp = forecast.data!.data.temperature2MMax[index];
                      final wind = forecast.data!.data.windSpeed10MMax[index];
                      final cloud = forecast.data!.data.cloudCoverMean[index];
                      final visibility =
                          forecast.data!.data.visibilityMean[index];
                      final precipitation =
                          forecast
                              .data!
                              .data
                              .precipitationProbabilityMax[index];
                      return SizedBox(
                        width: 120,
                        child: Card.filled(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 4,
                            ),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  '$temp${forecast.data!.units.temperature2MMax}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 16),
                                WeatherDetail(
                                  icon: Icon(Icons.water_drop),
                                  value: precipitation,
                                  unit:
                                      forecast
                                          .data!
                                          .units
                                          .precipitationProbabilityMax,
                                ),
                                SizedBox(height: 8),
                                WeatherDetail(
                                  icon: Icon(Icons.air),
                                  value: wind,
                                  unit: forecast.data!.units.windSpeed10MMax,
                                ),
                                SizedBox(height: 8),
                                WeatherDetail(
                                  icon: Icon(Icons.cloud),
                                  value: cloud,
                                  unit: forecast.data!.units.cloudCoverMean,
                                ),
                                SizedBox(height: 8),
                                WeatherDetail(
                                  icon: Icon(Icons.visibility),
                                  value: (visibility / 1000).toInt(),
                                  unit: 'km',
                                ),
                                SizedBox(height: 16),
                                Text(
                                  DateFormat().add_Md().format(date),
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 4),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({
    super.key,
    required this.icon,
    required this.value,
    this.unit,
  });

  final Icon icon;
  final dynamic value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Text('$value$unit', style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
