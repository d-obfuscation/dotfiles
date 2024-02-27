function fish_prompt
    set_color brblack
    echo -n '❰ DISTORTED '
    set_color normal
    echo -n '⌥ /'
    echo -n (prompt_pwd)
    set_color brblack
    echo -n ' ❱'
    set_color normal
    echo -n ' '
end
