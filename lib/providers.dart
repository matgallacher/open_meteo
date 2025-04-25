import 'package:open_meteo/location/location_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers extends MultiProvider {
  Providers({
    super.key,
    List<SingleChildWidget> providers = const [],
    required super.child,
  }) : super(
         providers: [
           ...providers,
           ChangeNotifierProvider(create: (context) => LocationService()),
         ],
       );
}
