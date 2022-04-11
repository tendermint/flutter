run:
	cd starport_template && fvm flutter run --dart-define=LCD_URL=https://api.testnet.cosmos.network --dart-define=LCD_PORT=443 --dart-define=GRPC_URL=https://grpc.testnet.cosmos.network --dart-define=GRPC_PORT=443

install-cosmos-ui-components: 
	$(info Running flutter pub upgrade on `cosmos_ui_components`)
	cd packages/cosmos_ui_components && fvm install && fvm flutter pub upgrade
	
install-cosmos-utils: 
	$(info Running flutter pub upgrade on `cosmos_utils`)
	cd packages/cosmos_utils && fvm install && fvm flutter pub upgrade
	
install-cosmos-auth: 
	$(info Running flutter pub upgrade on `cosmos_auth`)
	cd packages/cosmos_auth && fvm install && fvm flutter pub upgrade

install-transaction-signing-gateway: 
	$(info Running flutter pub upgrade on `transaction_signing_gateway`)
	cd packages/transaction_signing_gateway && fvm install && fvm flutter pub upgrade

install-starport-template: 
	$(info Running flutter pub upgrade on `transaction_signing_gateway`)
	cd starport_template && fvm install && fvm flutter pub upgrade

# Ensures proper flutter channel is in use, runs pub upgrade.
install:
	$(MAKE) install-cosmos-auth
	$(MAKE) install-cosmos-ui-components
	$(MAKE) install-cosmos-utils
	$(MAKE) install-transaction-signing-gateway
	$(MAKE) install-starport-template
	$(info Done)

fix-lint:
	$(info Running flutter format)
	fvm flutter format --line-length 120 --set-exit-if-changed starport_template/lib starport_template/test
	
run-starport-template:
	$(info Running starport_template using testnet.cosmos.network)
	cd starport_template && fvm flutter run --dart-define=LCD_URL=https://api.testnet.cosmos.network --dart-define=LCD_PORT=443 --dart-define=GRPC_URL=https://grpc.testnet.cosmos.network --dart-define=GRPC_PORT=443
