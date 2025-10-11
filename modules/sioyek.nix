{ lib, ... }:

{
  home-manager.users.nartan.programs.sioyek = {
    enable = true;
    config = {
      "new_command _add_text" = "python -m sioyek.add_text \"%{sioyek_path}\" \"%{local_database}\" \"%{shared_database}\" \"%{file_path}\" \"%{selected_rect}\" \"%{command_text}\"";

        "new_command _embed_annotations_in_file" = "python /etc/nixos/modules/embed_annotations_in_file.py \"%{sioyek_path}\" \"%{local_database}\" \"%{shared_database}\" \"%{file_path}\"";
    };
  };
}
