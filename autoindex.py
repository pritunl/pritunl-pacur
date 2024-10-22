import os
from datetime import datetime, timezone

ROOT_DIR = "mirror"
HTML_HEADER = """
<html><head><title>Index of /{relative_path}</title></head>
<body bgcolor="white">
<h1>Index of /{relative_path}</h1><hr><pre><a href="../">../</a>
"""
HTML_FOOTER = """</pre><hr>
</body></html>
"""
def generate_directory_listing_html(current_dir, relative_path, dirs, files):
    html = HTML_HEADER.format(relative_path=relative_path)

    for directory in sorted(dirs):
        dir_path = os.path.join(current_dir, directory)
        stat_info = os.stat(dir_path)
        modified_time = datetime.fromtimestamp(stat_info.st_mtime,
            tz=timezone.utc).strftime("%d-%b-%Y %H:%M")
        html += f"<a href=\"{directory}/\">{directory}/</a>" + \
            f"{" " * (51 - len(directory) - 1)}{modified_time}{" " * 20}-\n"

    for file_name in sorted(files):
        if file_name == "index.html":
            continue
        file_path = os.path.join(current_dir, file_name)
        stat_info = os.stat(file_path)
        modified_time = datetime.fromtimestamp(stat_info.st_mtime,
            tz=timezone.utc).strftime("%d-%b-%Y %H:%M")
        file_size = f"{stat_info.st_size:21}"
        html += f"<a href=\"{file_name}\">{file_name}</a>" + \
            f"{" " * (51 - len(file_name))}{modified_time}{file_size}\n"

    html += HTML_FOOTER

    return html

def generate_index_files(root_dir):
    for current_dir, subdirs, files in os.walk(root_dir):
        relative_path = os.path.relpath(current_dir, root_dir)
        if relative_path == ".":
            relative_path = ""
        else:
            relative_path += "/"

        html_content = generate_directory_listing_html(current_dir,
            relative_path, sorted(subdirs), sorted(files))
        index_path = os.path.join(current_dir, "index.html")

        with open(index_path, "w") as f:
            f.write(html_content)

        print(f"Generated index.html for: {current_dir}")

generate_index_files(ROOT_DIR)
