import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/helpers/mnemonic_generator.dart';
import 'package:flutter_app/views/password_generation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MnemonicOnboarding extends StatefulWidget {
  @override
  _MnemonicOnboardingState createState() => _MnemonicOnboardingState();
}

class _MnemonicOnboardingState extends State<MnemonicOnboarding> {
  String mnemonic = '';

  @override
  void initState() {
    super.initState();
    _getSharedPreferences();
  }

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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GridView.count(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width * 0.005).ceil(),
                        shrinkWrap: true,
                        childAspectRatio: 5,
                        children: mnemonic
                            .split(' ')
                            .map(
                              (e) => buildChoiceChip(e, context),
                            )
                            .toList(),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Follow best practices for security. Be sure to write your mnemonic pass phrase in a safe place. This phrase is the only way to recover your account if you forget your password. Without your password or recovery passphrase, account recovery is not possible. Even Emeris cannot help you.',
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PasswordGenerationPage(mnemonic: mnemonic),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Proceed'),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
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

  Widget buildChoiceChip(String e, BuildContext context) {
    return ChoiceChip(
      label: Text(e),
      selected: true,
      avatar: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Text(
          (mnemonic.split(' ').indexOf(e) + 1).toString(),
          style: TextStyle(fontSize: 12),
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      selectedColor: Theme.of(context).primaryColorDark,
    );
  }

  void _getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isWalletCreated = prefs.getBool(SharedPreferencesKeys.isWalletCreated);
    if (isWalletCreated != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PasswordGenerationPage(),
        ),
      );
    }
  }
}
