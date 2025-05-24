import os
import shutil

def main():
    # Prompt user for the base source directory where files are stored
    source_base_dir = input("Enter the full path to the folder containing the source files (e.g., D:\\AdibooEnergy): ").strip()

    if not os.path.isdir(source_base_dir):
        print(f"The specified source directory does not exist: {source_base_dir}")
        return

    # Prompt user for installation directory path
    install_dir = input("Enter the full path to the installation directory (e.g., C:\\Program Files (x86)\\Coktel\\Adiboo and The Energy Thieves): ").strip()

    if not install_dir:
        print("Installation path cannot be empty.")
        return

    # Create installation directory if it does not exist
    try:
        os.makedirs(install_dir, exist_ok=True)
        print(f"Installation directory set to: {install_dir}")
    except Exception as e:
        print(f"Error creating installation directory: {e}")
        return

    # List of relative file paths from the source base directory
    relative_files_to_copy = [
        "Adiboo_Energy_Config.edp",
        "Adiboo_Energy_Config.exe",
        "Adiboo_Energy_Thieves.exe",
        "LG.ini",
        "mfc42.dll",
        "MOVIE.EDP",
        "msvcp60.dll",
        os.path.join("Bin", "Adiboo_Energy_Config.exe"),
        os.path.join("Bin", "Adiboo_Energy_Thieves.exe"),
    ]

    # Copy files
    for rel_path in relative_files_to_copy:
        source_file = os.path.join(source_base_dir, rel_path)
        if os.path.isfile(source_file):
            try:
                shutil.copy(source_file, install_dir)
                print(f"Copied {source_file} to {install_dir}")
            except Exception as e:
                print(f"Error copying {source_file}: {e}")
        else:
            print(f"File not found: {source_file}")

    # Handle DATA folder
    data_source = os.path.join(source_base_dir, "DATA")
    data_dest = os.path.join(install_dir, "DATA")

    # Create DATA directory first
    try:
        os.makedirs(data_dest, exist_ok=True)
        print(f"Ensured DATA directory exists at installation path: {data_dest}")
    except Exception as e:
        print(f"Error creating DATA directory: {e}")
        return

    # Copy contents of DATA folder if source exists
    if os.path.exists(data_source) and os.path.isdir(data_source):
        try:
            for item in os.listdir(data_source):
                s = os.path.join(data_source, item)
                d = os.path.join(data_dest, item)
                if os.path.isdir(s):
                    shutil.copytree(s, d, dirs_exist_ok=True)
                else:
                    shutil.copy2(s, d)
            print(f"Copied contents from DATA source folder to {data_dest}")
        except Exception as e:
            print(f"Error copying DATA folder contents: {e}")
    else:
        print(f"DATA directory not found at source: {data_source}. Empty DATA directory created at installation path.")

    print("Installation completed.")

if __name__ == "__main__":
    main()
