import 'package:mobx/mobx.dart';
import 'package:vale_vendas/app/home/domain/usecases/get.products.dart';
import 'package:vale_vendas/app/shared/errors/failure.dart';
import 'package:vale_vendas/app/shared/models/product.dart';
import 'package:vale_vendas/app/shared/utils/modal.bottom.sheet.dart';

part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase(this._getProducts);

  //***************************** Final variables *****************************//

  final GetProducts _getProducts;

  //******************************* Observables *******************************//

  @observable
  bool loadingPage = false;

  @observable
  ObservableList<Product> productList = ObservableList<Product>();

  //***************************** Common variables *****************************//

  @observable
  String? noteError;

  //********************************* Getters *********************************//

  //*************************** Computed properties ***************************//

  //********************************* Actions *********************************//

  //******************************** Functions ********************************//

  Future<void> getProducts() async {
    return await _getProducts().then(
      (result) => result.fold(
        (l) {
          if (l.runtimeType == UnexpectedError) {
            ModalBottomSheets.showUnexpectedErrorBottomSheet();
          } else if (l.runtimeType == ConnectionError) {
            ModalBottomSheets.showConnectionErrorBottomSheet();
          }
        },
        (r) {
          productList.addAll(r);
        },
      ),
    );
  }
}
