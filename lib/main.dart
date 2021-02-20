import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_product/ui/model/product_item.dart';
import 'package:pharmacy_product/ui/screens/product_details.dart';
import 'package:pharmacy_product/ui/screens/screens.dart';
import 'package:pharmacy_product/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.injector<ProductViewModel>()),
      ],
      child: MaterialApp(
        title: 'Pharmacy Product',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          dividerColor: Colors.black12,
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            brightness: Brightness.light,
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          cardColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        onGenerateRoute: (RouteSettings settings){
          var routes = <String, WidgetBuilder>{
            '/productDetails': (context) => ProductDetails(settings.arguments as ProductItem),
          };
          WidgetBuilder builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder(ctx));
        },
      ),
    );
  }
}
