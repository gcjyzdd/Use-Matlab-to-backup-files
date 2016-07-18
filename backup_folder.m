function backup_folder(folder1,folder2)
%% back up a folder

% By Changjie Guan, TU/e, July 18,2016.

files1=dir(folder1);
files2=dir(folder2);

for i=1:size(files1,1)
    
    if strcmp(files1(i).name,'.') || strcmp(files1(i).name,'..')
        % the current path is '.' or '..'
        fprintf('%s \n',files1(i).name);
    else
        
        
        % the current path is a true path
        if isdir([folder1,'/',files1(i).name])
            % the current path is a folder
            
            fprintf('%s is a folder\n',files1(i).name);
            % check if folder2 has this dir
            
            if exist([folder2,'/',files1(i).name],'dir')
                % folder2 has this dir
                backup_folder([folder1,'/',files1(i).name],[folder2,'/',files1(i).name]);
            else
                % folder2 does not has this dir
                fprintf('%s does not have folder <%s> . Create and copy.\n',folder2,files1(i).name)
                mkdir([folder2,'/',files1(i).name])
                try
                    copyfile([folder1,'/',files1(i).name,'/*'],[folder2,'/',files1(i).name,'/']);
                end
            end
            
        else
            % the current path is a document
            fprintf('%s is a document\n',files1(i).name);
            
            if exist([folder2,'/',files1(i).name])
                % the destination folder has this document
                temp=dir([folder2,'/',files1(i).name]);
                if temp.datenum<files1(i).datenum
                    fprintf('%s in %s is newer, copy it to %s \n',files1(i).name,folder1,folder2);
                    copyfile([folder1,'/',files1(i).name],[folder2,'/'],'f');
                end
            else
                copyfile([folder1,'/',files1(i).name],[folder2,'/']);
            end
            
        end
    end
end
