import os
import re
import argparse

def rectify_directories(GITHUB_WORKSPACE: str):
    all_dirs = []
    lab_folders_regex = GITHUB_WORKSPACE + r"\/lab-([0-9]*)\/([A-Za-z0-9_-]*)"
    ## Find all the assignment dirs with no READMEs
    for root, dirs, files in os.walk(GITHUB_WORKSPACE):
        tmp = []
        for dir_name in dirs:
            current_path = os.path.join(root,dir_name)
            if re.match(lab_folders_regex,current_path) and not os.path.exists(os.path.join(current_path,"README.md")):
                tmp.append(current_path)

        all_dirs.extend(tmp)

    print(f"Found {len(all_dirs)} directories with no readme!")
    print("Adding READMEs to these directories. Please fill in template later!")

    for dir_name in all_dirs:
        os.system("cp " + GITHUB_WORKSPACE + "/.github/workflows/README.md" + " " + dir_name)
    


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
rectify_directories(args.path)
