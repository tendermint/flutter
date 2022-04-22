/// To enable `cosmos_lint`,
/// 1. Add it to your dev_dependencies
/// ```yaml
/// dev_dependencies:
/// cosmos_lint:
///     git:
///       url: https://github.com/tendermint/flutter.git
///       path: packages/cosmos_lint
///       ref: main
/// ```
///
/// 2. Include the rules into your `analysis_options.yaml`
/// ```yaml
/// include: package:cosmos_lint/analysis_options.yaml
/// ```
library lint;
