import 'package:get_it/get_it.dart';
import 'package:pharmacy_product/viewmodels/product_viewmodel.dart';
import 'package:pharmacy_product/data/data.dart';


final injector = GetIt.instance;

void init()  {
  injector.registerLazySingleton<ProductViewModel>(() => ProductViewModel(products));
}
