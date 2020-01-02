import 'package:flutter/material.dart';
import 'package:wmn_plus/features/profile/change_mode/change_mode_fertility/index.dart';

class ChangeModeFertilityPage extends StatelessWidget {
  static const String routeName = '/changeModeFertility';

  @override
  Widget build(BuildContext context) {
    var _changeModeFertilityBloc = ChangeModeFertilityBloc();
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: ChangeModeFertilityScreen(changeModeFertilityBloc: _changeModeFertilityBloc),
    );
  }
}
