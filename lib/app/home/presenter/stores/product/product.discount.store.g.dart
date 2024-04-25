// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.discount.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDiscountStore on ProductDiscountStoreBase, Store {
  late final _$selectedOptionAtom =
      Atom(name: 'ProductDiscountStoreBase.selectedOption', context: context);

  @override
  String? get selectedOption {
    _$selectedOptionAtom.reportRead();
    return super.selectedOption;
  }

  @override
  set selectedOption(String? value) {
    _$selectedOptionAtom.reportWrite(value, super.selectedOption, () {
      super.selectedOption = value;
    });
  }

  @override
  String toString() {
    return '''
selectedOption: ${selectedOption}
    ''';
  }
}
