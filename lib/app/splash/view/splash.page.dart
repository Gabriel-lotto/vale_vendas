import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vale_vendas/app/shared/widgets/body.widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () => Modular.to.navigate('/home/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const BodyWidget(
      bottomSheet: SizedBox(),
      showAppBar: false,
      pageTitle: '',
    );
  }
}
