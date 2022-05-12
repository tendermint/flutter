gen:
	rm -rf .chain
	mkdir .chain
	rm -rf ./lib/protos
	cd .chain && ignite s chain cosmos_node_client
	cd .chain/cosmos_node_client && ignite s list post title body --yes && ignite g dart --yes
	mkdir -p ./lib/protos/
	mv .chain/cosmos_node_client/flutter/lib/generated/ ./lib/protos/
	rm -rf .chain

