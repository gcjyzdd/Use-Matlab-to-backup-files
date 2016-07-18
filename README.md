# Use-Matlab-to-backup-files
Use Matlab file manipulations to backup files

## Description
Backup folder1 to folder2. If a file in folder1 is not in folder2 with the same subpath or newer than the file with the same name, copy it to folder2. File that is in folder2 but bot in folder1 keeps the same after running the function.

With this function, we can regularly backup our files to a removable disk while only copy the updated files. 

## Usage
backup_folder('src','dst')

'src' is the source folder that can contain subfolders and files;

'dst' is the destination folder, where you'd like to put your backup files.

For example, backup_folder('C:\Test1','C:\Test2');
