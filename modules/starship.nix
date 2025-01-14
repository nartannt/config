{ lib, ... }:

{
home-manager.users.nartan.programs.starship = {
#programs.starship = {
  enable = true;
  enableBashIntegration = true;
  settings = {
      add_newline = true;
      format = lib.concatStrings[
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_commit"
          "$git_state$"
          "git_metrics"
          "$c"
          "$cmake"
          "$lua"
          "$ocaml"
          "$python"
          "$rust"
          "$scala"
          "$nix_shell"
          "$memory_usage"
          "$custom"
          "$sudo"
          "$cmd_duration"
          "$line_break"
          "$jobs"
          "$battery"
          "$time$"
          "status"
          "$shell"
          "$character"
      ];
        battery = { disabled = true; };
        ocaml = {
          format = "[$symbol($version )(($switch_indicator$switch_name) )]($style)";
          global_switch_indicator = "";
          local_switch_indicator = "*";
          style = "bold yellow";
          symbol = "🐫 ";
          version_format = "v$raw";
          disabled = false;
          detect_extensions = [
            "ml"
            "mli"
          ];
          detect_files = [
            "dune"
            "dune-project"
          ];
    };
            git_branch = {
          format = "[$symbol$branch(:$remote_branch)]($style) ";
          symbol = " ";
          style = "bold purple bg:0xFCA17D";
          truncation_length = 9223372036854775807;
          truncation_symbol = "…";
          only_attached = false;
          always_show_remote = false;
          ignore_branches = [];
          disabled = false;
        };
        git_commit = {
          commit_hash_length = 7;
          format = "[($hash$tag)]($style) ";
          style = "green bold";
          only_detached = true;
          disabled = false;
          tag_symbol = " 🏷  ";
          tag_disabled = true;
        };
        git_metrics = {
          added_style = "bold green";
          deleted_style = "bold red";
          only_nonzero_diffs = true;
          format = "([+$added]($added_style) )([-$deleted]($deleted_style) )";
          disabled = false;
        };
        git_state = {
          am = "AM";
          am_or_rebase = "AM/REBASE";
          bisect = "BISECTING";
          cherry_pick = "🍒PICKING(bold red)";
          disabled = false;
          format = "([$state( $progress_current/$progress_total)]($style)) ";
          merge = "MERGING";
          rebase = "REBASING";
          revert = "REVERTING";
          style = "bold yellow";
        };
        git_status = {
          ahead = "🏎💨$count";
          behind = "😰$count";
          conflicted = "🏳";
          deleted = "🗑";
          disabled = false;
          diverged = "😵";
          format = "([[$all_status$ahead_behind]]($style) )";
          ignore_submodules = false;
          modified = "📝";
          renamed = "👅";
          staged = "[++($count)](green)";
          stashed = "📦";
          style = "red bold bg:0xFCA17D";
          untracked = "🤷";
          up_to_date = "✓";
        };
  };
};
}

    #battery = {
    #  format = "[$symbol$percentage]($style) ";
    #};
    #format = "[blabla]$all$shell$nix_shell$battery";
    #character = {
    #  success_symbol = "[✓](bold green) ";
    #  error_symbol = "[✗](bold red) ";
    #  home_symbol = "~";
    #  truncation_symbol = "aaa";
    #  not_executable_symbol = "xxx";
    #  tag_symbol = "bbb";
    #  not_found_symbol = "ccc";
    #  signal_symbol = "ddd";
    #  expiration_symbol = "eee";
    #};
    #battery = {
    #  format = "[$symbol$percentage]($style) ";
    #  disabled = false;
    #  display = [
    #    {
    #      style = "red bold";
    #      threshold = 10;
    #    }
    #  ];
    #  charging_symbol = "gggg";
    #  discharging_symbol = "hhhh";
    #  empty_symbol = "qsdfsd";
    #  full_symbol = "jjjjj";
    #  unknown_symbol = "AAA";
    #};
    #nix_shell = {
    #  format = "[$symbol$state( ($name))]($style) ";
    #  disabled = false;
    #  impure_msg = "[impure](bold red)";
    #  pure_msg = "[pure](bold green)";
    #  style = "bold blue";
    #  symbol = "a";
    #};
    #shell = {
    #      format = "[$indicator]($style) ";
    #      bash_indicator = "bsh";
    #      cmd_indicator = "cmd";
    #      elvish_indicator = "esh";
    #      fish_indicator = "";
    #      ion_indicator = "ion";
    #      nu_indicator = "nu";
    #      powershell_indicator = "a";
    #      style = "white bold";
    #      tcsh_indicator = "tsh";
    #      unknown_indicator = "mystery shell";
    #      xonsh_indicator = "xsh";
    #      zsh_indicator = "zsh";
    #      disabled = false;
    #    };
