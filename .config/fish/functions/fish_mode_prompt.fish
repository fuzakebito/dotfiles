function fish_mode_prompt
  set_color black
  switch $fish_bind_mode
    case default
      set_color -b 8A8A8A
      echo 'N'
	  set_color 8A8A8A
    case insert
      set_color -b blue
      echo 'I'
	  set_color blue
    case replace_one
      set_color -b blue
      echo 'R'
	  set_color blue
    case visual
      set_color -b green
      echo 'V'
	  set_color green
    case '*'
      set_color -b red
      echo '?'
	  set_color red
  end
  set_color -b brblack
  printf ''
  set_color normal
  printf '%s' (fish_vcs_prompt)
  set_color brblack
end
