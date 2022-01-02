# nix-shell --command 'cp Strify.roc tests && for f in tests/test_*.roc; do ./roc/target/release/roc $f; done && rm tests/Strify.roc' ./roc/shell.nix
nix-shell --command 'cp Strify.roc tests && ./roc/target/release/roc ./tests/test_all.roc && rm tests/Strify.roc' ./roc/shell.nix
