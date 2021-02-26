function fish_prompt --description 'Write out the prompt'
	set -l last_pipestatus "0"
    set -l last_pipestatus $pipestatus

    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q __fish_git_prompt_hide_untrackedfiles
        set -g __fish_git_prompt_hide_untrackedfiles 1
    end
    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch magenta --bold
    end
    if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream "informative"
    end
    if not set -q __fish_git_prompt_char_upstream_ahead
        set -g __fish_git_prompt_char_upstream_ahead "↑"
    end
    if not set -q __fish_git_prompt_char_upstream_behind
        set -g __fish_git_prompt_char_upstream_behind "↓"
    end
    if not set -q __fish_git_prompt_char_upstream_prefix
        set -g __fish_git_prompt_char_upstream_prefix ""
    end
    if not set -q __fish_git_prompt_char_stagedstate
        set -g __fish_git_prompt_char_stagedstate "●"
    end
    if not set -q __fish_git_prompt_char_dirtystate
        set -g __fish_git_prompt_char_dirtystate "✚"
    end
    if not set -q __fish_git_prompt_char_untrackedfiles
        set -g __fish_git_prompt_char_untrackedfiles "…"
    end
    if not set -q __fish_git_prompt_char_invalidstate
        set -g __fish_git_prompt_char_invalidstate "✖"
    end
    if not set -q __fish_git_prompt_char_cleanstate
        set -g __fish_git_prompt_char_cleanstate "✔"
    end
    if not set -q __fish_git_prompt_color_dirtystate
        set -g __fish_git_prompt_color_dirtystate blue
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_untrackedfiles
        set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate cyan --bold
    end

    set -l color_suffix
    set -l prefix
    set -l suffix
    switch "$USER"
        case root toor
			set color_suffix red
            set suffix '#'
        case '*'
            set color_suffix cyan
            set suffix '$'
    end

    # PWD
    set_color -b brwhite
    printf ''
    set_color black
    printf '%s' (prompt_pwd)
    set_color brwhite

	if string length -q -- fish_vcs_prompt
	    if test $last_pipestatus != 0
	        set_color -b brblack
            printf ''
	        set_color normal
            printf '%s' (fish_vcs_prompt)
	        set_color brblack
		    set_color -b yellow
            printf ''
		    set_color black
            echo -n [$last_pipestatus]
		    set_color yellow
	        set_color -b brblack
            printf ''
	        set_color normal
            printf '%s' (fish_vcs_prompt)
	        set_color brblack
	    end
	else
	    set_color -b brblack
        printf ''
	    set_color normal
        printf '%s' (fish_vcs_prompt)
	    set_color brblack
	    if test $last_pipestatus != 0
		    set_color -b yellow
            printf ''
		    set_color black
            echo -n [$last_pipestatus]
		    set_color yellow
	        set_color -b brblack
            printf ''
	        set_color normal
            printf '%s' (fish_vcs_prompt)
	        set_color brblack
	    end
	end


    set_color -b $color_suffix
    printf ''
	set_color black
	set_color -b $color_suffix
    echo -n "$suffix"
	set_color normal
	set_color $color_suffix
    printf ''
	set_color normal
end
