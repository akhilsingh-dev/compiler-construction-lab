import os
import re
import argparse
from pprint import pprint


def modify_readme(title: str, lab_number: int):
    global GITHUB_WORKSPACE

    img_path = f"../../images/lab-{lab_number}/{title}_output.jpg"
    with open(f"{GITHUB_WORKSPACE}/lab-{lab_number}/{title}/README.md","r") as f:
        txt = f.read()
    txt = re.sub("<TITLE>",title,txt)
    txt = re.sub("<IMAGE>",f"![{title} output](../../images/lab-{lab_number}/{title}_output.jpg)",txt)
    with open(f"{GITHUB_WORKSPACE}/lab-{lab_number}/{title}/README.md","w") as f:
        f.write(txt)
    print(f"[INFO] : README updated for the directory: /lab-{lab_number}/{title}")


def rectify_directories():
    global GITHUB_WORKSPACE
    all_dirs = []
    lab_folders_regex = GITHUB_WORKSPACE + r"\/lab-([0-9]*)\/([A-Za-z0-9_-]*)"

    ## Find all the assignment dirs with no READMEs
    for root, dirs, files in os.walk(GITHUB_WORKSPACE):
        for dir_name in dirs:
            current_path = os.path.join(root,dir_name)
            m = re.match(lab_folders_regex,current_path)
            if m and not os.path.exists(os.path.join(current_path,"README.md")):
                lab_number,title = m.groups()
                all_dirs.append({
                    "title": title,
                    "path": current_path,
                    "lab_number": lab_number
                })
        
    print(f"Found {len(all_dirs)} directories with no readme!")
    print("Adding READMEs to these directories. Please fill in template later!")
    pprint(all_dirs)

    for dir_info in all_dirs:
        p = dir_info["path"]
        os.system(f"cp {GITHUB_WORKSPACE}/templates/README.md {p}")
        print(f"[INFO]: Copied README to {p}")
        modify_readme(dir_info["title"],dir_info["lab_number"])




def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(f"[ERROR] : {path} is not a valid path")

def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('--path', type=dir_path)
    return parser.parse_args()

args = parse_arguments()
GITHUB_WORKSPACE = args.path
rectify_directories()

