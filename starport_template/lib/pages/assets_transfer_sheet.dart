import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/amount_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/starport_app.dart';

class AssetsTransferSheet extends StatefulWidget {
  const AssetsTransferSheet({
    required this.onTapDone,
    required this.recipientGetsAmountBalance,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTapDone;
  final Balance recipientGetsAmountBalance;

  @override
  State<AssetsTransferSheet> createState() => _AssetsTransferSheetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback>.has('onTapDone', onTapDone))
      ..add(DiagnosticsProperty<Balance>('balance', recipientGetsAmountBalance));
  }
}

class _AssetsTransferSheetState extends State<AssetsTransferSheet> {
  bool get isLoading => StarportApp.accountsStore.isSendMoneyLoading;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return CosmosBottomSheetContainer(
      child: Observer(
        builder: (context) {
          return SafeArea(
            top: false,
            child: ContentStateSwitcher(
              isLoading: isLoading,
              loadingChild: Column(
                children: [
                  SizedBox(height: theme.spacingXXXL),
                  Text('Transferring', style: CosmosTextTheme.title2Bold),
                  SizedBox(height: theme.spacingM),
                  Text(
                    'This may take up to 1 minute.',
                    style: CosmosTextTheme.copy0Normal,
                  ),
                  const Spacer(),
                  const ContentLoadingIndicator(),
                  const Spacer(),
                  Text(
                    '${widget.recipientGetsAmountBalance.amount.value.toString()} ${widget.recipientGetsAmountBalance.denom}'
                        .toUpperCase(),
                    style: CosmosTextTheme.title0Medium,
                  ),
                  const Spacer(),
                ],
              ),
              contentChild: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.spacingL,
                  vertical: theme.spacingM,
                ),
                child: Column(
                  children: [
                    SizedBox(height: theme.spacingXXXL),
                    SizedBox(
                      height: 56,
                      width: 56,
                      child: Image.asset('assets/images/check_circle.png'),
                    ),
                    SizedBox(height: theme.spacingXL),
                    Text('Transferred!', style: CosmosTextTheme.title2Bold),
                    const Spacer(),
                    Text(
                      '${formatAmount(widget.recipientGetsAmountBalance.amount.value.toDouble())} '
                              '${widget.recipientGetsAmountBalance.denom}'
                          .toUpperCase(),
                      style: CosmosTextTheme.title0Medium,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CosmosElevatedButton(
                            onTap: widget.onTapDone,
                            text: 'Done',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isLoading', isLoading));
  }
}
