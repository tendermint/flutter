install-cosmos-ui-components: 
	$(info Running flutter pub get on `cosmos_ui_components`)
	cd packages/cosmos_ui_components && fvm install && fvm flutter pub upgrade
	
install-cosmos-utils: 
	$(info Running flutter pub get on `cosmos_utils`)
	cd packages/cosmos_utils && fvm install && fvm flutter pub upgrade

install-transaction-signing-gateway: 
	$(info Running flutter pub get `transaction_signing_gateway`)
	cd packages/transaction_signing_gateway  && fvm install && fvm flutter pub upgrade

install-starport-template: 
	$(info Running flutter pub get `transaction_signing_gateway`)
	cd starport_template  && fvm install && fvm flutter pub upgrade

	
# Ensures proper flutter channel is in use, runs pub upgrade.
install:
	$(MAKE) install-cosmos-ui-components
	$(MAKE) install-cosmos-utils
	$(MAKE) install-transaction-signing-gateway
	$(MAKE) install-starport-template
	$(info Done)