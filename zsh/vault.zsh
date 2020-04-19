export VAULT_ADDR=https://10.129.2.101:8200
alias vssh='vault ssh -tls-skip-verify -role unix-admin -mode ca -mount-point ssh-client-signer'
