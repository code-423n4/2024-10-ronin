deploy-testnet:
	op run --env-file="./.env" -- \
	forge script DeployKatanaV3Testnet -f ronin-testnet

deploy-testnet-broadcast:
	op run --env-file="./.env" -- \
	forge script DeployKatanaV3Testnet -f ronin-testnet --verify --verifier sourcify --verifier-url https://sourcify.roninchain.com/server/ --legacy --broadcast