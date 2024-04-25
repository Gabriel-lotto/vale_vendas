import 'package:mobx/mobx.dart';

part 'product.discount.store.g.dart';

class ProductDiscountStore = ProductDiscountStoreBase with _$ProductDiscountStore;

abstract class ProductDiscountStoreBase with Store {
  //***************************** Final variables *****************************//

  //******************************* Observables *******************************//

  @observable
  String? selectedOption;

  //***************************** Common variables *****************************//

  //********************************* Getters *********************************//

  //*************************** Computed properties ***************************//

  //********************************* Actions *********************************//

  //******************************** Functions ********************************//
}
