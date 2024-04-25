// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$loadingPageAtom =
      Atom(name: 'HomeStoreBase.loadingPage', context: context);

  @override
  bool get loadingPage {
    _$loadingPageAtom.reportRead();
    return super.loadingPage;
  }

  @override
  set loadingPage(bool value) {
    _$loadingPageAtom.reportWrite(value, super.loadingPage, () {
      super.loadingPage = value;
    });
  }

  late final _$productListAtom =
      Atom(name: 'HomeStoreBase.productList', context: context);

  @override
  ObservableList<Product> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(ObservableList<Product> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  late final _$noteErrorAtom =
      Atom(name: 'HomeStoreBase.noteError', context: context);

  @override
  String? get noteError {
    _$noteErrorAtom.reportRead();
    return super.noteError;
  }

  @override
  set noteError(String? value) {
    _$noteErrorAtom.reportWrite(value, super.noteError, () {
      super.noteError = value;
    });
  }

  @override
  String toString() {
    return '''
loadingPage: ${loadingPage},
productList: ${productList},
noteError: ${noteError}
    ''';
  }
}
