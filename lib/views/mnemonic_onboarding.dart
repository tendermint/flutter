import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/mnemonic_generator.dart';

class MnemonicOnboarding extends StatefulWidget {
  @override
  _MnemonicOnboardingState createState() => _MnemonicOnboardingState();
}

class _MnemonicOnboardingState extends State<MnemonicOnboarding> {
  String mnemonic = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: mnemonic.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        spacing: 8,
                        alignment: WrapAlignment.spaceBetween,
                        children: mnemonic
                            .split(' ')
                            .map(
                              (e) => buildChoiceChip(e, context),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Please write this down somewhere safe, if you lose this, you will not get your account back. Not even Demeris could help you with that.',
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      mnemonic = MnemonicGenerator.generateMnemonic();
                      setState(() {});
                    },
                    child: Text('Create a new wallet'),
                  ),
          ),
        ),
      ),
    );
  }

  ChoiceChip buildChoiceChip(String e, BuildContext context) {
    return ChoiceChip(
      label: Text(e),
      selected: true,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      selectedColor: Theme.of(context).primaryColorDark,
    );
  }
}
