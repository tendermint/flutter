gen:
	rm -rf .chain
	mkdir .chain
	rm -rf ./lib/proto
	cd .chain && ignite s chain cosmos_node_client
	cd .chain/cosmos_node_client && ignite s list post title body --yes && ignite g dart --yes
	mkdir -p ./lib/proto/
	mv .chain/cosmos_node_client/flutter/lib/generated/ ./lib/proto/
	rm -rf .chain

