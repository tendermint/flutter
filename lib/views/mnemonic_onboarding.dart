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
          padding: EdgeInsets.only(left: 16.0),
          child: Center(
            child: mnemonic.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: mnemonic
                            .split(' ')
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: ChoiceChip(
                                  label: Text(e),
                                  selected: true,
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  selectedColor:
                                      Theme.of(context).primaryColorDark,
                                ),
                              ),
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
}
