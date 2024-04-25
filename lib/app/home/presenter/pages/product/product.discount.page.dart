import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vale_vendas/app/home/presenter/stores/product/product.discount.store.dart';
import 'package:vale_vendas/app/shared/models/product.dart';
import 'package:vale_vendas/app/shared/utils/colors.default.dart';
import 'package:vale_vendas/app/shared/utils/responsiveness.dart';
import 'package:vale_vendas/app/shared/widgets/body.widget.dart';
import 'package:vale_vendas/app/shared/widgets/primary.button.widget.dart';
import 'package:vale_vendas/app/shared/widgets/text.field.widget.dart';

class ProductEditDiscountPage extends StatefulWidget {
  final bool isEditPage;
  final Product? product;
  const ProductEditDiscountPage({
    super.key,
    required this.isEditPage,
    this.product,
  });

  @override
  State<ProductEditDiscountPage> createState() => _ProductEditDiscountPageState();
}

class _ProductEditDiscountPageState extends State<ProductEditDiscountPage> {
  final store = Modular.get<ProductDiscountStore>();
  final discountNameTextController = TextEditingController();
  final discountDescriptionTextController = TextEditingController();
  final discountPriceFromTextController = TextEditingController(text: "0,00");
  final discountPriceToTextController = TextEditingController(text: "0,00");
  final discountActivationDateTextController = TextEditingController();
  final discountInactivationDateTextController = TextEditingController();

  @override
  initState() {
    getProductValues();
    super.initState();
  }

  getProductValues() {
    if (widget.isEditPage && widget.product != null) {
      discountNameTextController.text = widget.product!.title;
      discountDescriptionTextController.text = widget.product!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BodyWidget(
      bottomSheet: PrimaryButtonWidget(
        label: widget.isEditPage ? 'Salvar alterações' : 'Cadastrar desconto',
      ),
      pageTitle: widget.isEditPage ? 'Editar desconto' : 'Cadastro desconto',
      showAppBar: true,
      showBackButton: true,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 32.h),
          _TextFieldTitle(
            title: 'Nome do desconto',
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomTextFieldWidget(
                controller: discountNameTextController,
                textInputAction: TextInputAction.next,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _TextFieldTitle(
            title: 'Descrição',
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomTextFieldWidget(
                height: 100,
                controller: discountDescriptionTextController,
                enabled: widget.isEditPage ? false : true,
                textInputAction: TextInputAction.next,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _TextFieldTitle(
            title: 'Tipo do desconto',
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorsDefault.secondaryTextBlack.withOpacity(.2), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              child: Observer(
                builder: (_) {
                  return _MyDropdownButton(
                    selectedOption: store.selectedOption,
                    onChanged: (String value) {
                      store.selectedOption = value;
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _TextFieldTitle(
                  title: 'Preço “DE”',
                  child: CustomTextFieldWidget(
                    onChanged: (text) {
                      if (text.isEmpty) {
                        discountPriceFromTextController.text = "0,00";
                      } else {}
                      discountPriceFromTextController.selection =
                          TextSelection.collapsed(offset: discountPriceFromTextController.text.length);
                    },
                    controller: discountPriceFromTextController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CentavosInputFormatter(),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _TextFieldTitle(
                  title: 'Preço “POR”',
                  child: CustomTextFieldWidget(
                    onChanged: (text) {
                      if (text.isEmpty) {
                        discountPriceToTextController.text = "0,00";
                      } else {}
                      discountPriceToTextController.selection =
                          TextSelection.collapsed(offset: discountPriceToTextController.text.length);
                    },
                    controller: discountPriceToTextController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CentavosInputFormatter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _TextFieldTitle(
                  title: 'Data ativação',
                  child: CustomTextFieldWidget(
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    controller: discountActivationDateTextController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _TextFieldTitle(
                  title: 'Data inativação',
                  child: CustomTextFieldWidget(
                    controller: discountInactivationDateTextController,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 130.h),
        ],
      ),
    );
  }
}

class _TextFieldTitle extends StatelessWidget {
  final String title;
  final Widget child;
  const _TextFieldTitle({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorsDefault.secondaryTextBlack,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.h),
        child,
      ],
    );
  }
}

class _MyDropdownButton extends StatelessWidget {
  final String? selectedOption;
  final ValueChanged<String>? onChanged;

  const _MyDropdownButton({super.key, this.selectedOption, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDropdown(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedOption ?? 'Selecione uma opção',
                style: TextStyle(color: selectedOption != null ? Colors.black : Colors.grey),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  void showDropdown(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final List<String?> options = [
      'Desconto porcentagem',
      'Desconto valor',
      'Desconto quantidade',
    ];

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + size.height,
        position.dx + size.width,
        position.dy + size.height * 2,
      ),
      items: options.map((String? value) {
        return PopupMenuItem<String>(
          value: value,
          child: SizedBox(
            width: size.width * 2, // Largura igual à largura do container
            height: 50, // Altura igual à altura do container
            child: Center(
              child: Text(value ?? 'Nenhum'),
            ),
          ),
        );
      }).toList(),
    ).then((String? value) {
      if (value != null) {
        if (onChanged != null) {
          onChanged!(value);
        }
      }
    });
  }
}
