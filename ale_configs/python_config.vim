" Specify linters to use
let g:ale_linters={
    \   'python': ['pylance', 'mypy']
    \}
let g:ale_linters_explicit=1

" Reload ALE so these setttings take effect when sourcing this script
ALEStopAllLSPs              " Stop any lang servers previously running
sleep 100m
ALEDisable | ALEEnable      " Reload ALE (make config changes tak effect)
sleep 100m
ALELint                     " Lint open buffers with new config

