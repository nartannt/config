{ lib, ... }:

let
  shared_db_path = "~/Sync/sioyek/";
in
{
  home-manager.users.nartan.programs.sioyek = {
    enable = true;
    bindings = {
      "goto_next_tab" = "gt";
      "goto_prev_tab" = "gT";
    };

    config = {
      "shared_database_path" = "/home/nartan/Sync/sioyek/";

      "should_launch_new_window" = "1";

      "new_command _add_text" = "python -m sioyek.add_text \"%{sioyek_path}\" \"%{local_database}\" \"%{shared_database}\" \"%{file_path}\" \"%{selected_rect}\" \"%{command_text}\"";

        "new_command _embed_annotations_in_file" = "python ~/Sync/sioyek/embed_annotations_in_file.py \"%{sioyek_path}\" \"%{local_database}\" \"%{shared_database}\" \"%{file_path}\"";
        "new_command _test" = "python /home/nartan/Sync/sioyek/test.py %{selected_text} %{selection_begin_document} %{selection_end_document}";
    };
  };
}
