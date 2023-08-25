%path
tbl_files_path = "/d/emr217/u/ed002/Main_project/Subtomo-dynamo/place_object/alignment_bin_4_adj2_ite_0006/";

adjusted_tbl = [];
tbl_files = dir(strcat(tbl_files_path, '*.tbl'));
tbl_files_names = {tbl_files.name};
for i = 1:length(tbl_files_names)

    tomon = tbl_files_names{i};
    f_tomon = strcat(tbl_files_path, tomon);
    current_tbl = dread(f_tomon);
    
    %if size(current_tbl, 2) ~= 53
        %current_tbl = current_tbl(:,1:end-1);
    %end
    collumns_needed = 53;
    while size(current_tbl, 2) ~= collumns_needed
        current_tbl = current_tbl(:,1:end-1);
    end
    
    new_rows = current_tbl(current_tbl(:,10) > 0.37, :);
    adjusted_tbl = [adjusted_tbl; new_rows];
end
%----------------
adjusted_tbl(:,24) = adjusted_tbl(:,24) + adjusted_tbl(:,4);
adjusted_tbl(:,25) = adjusted_tbl(:,25) + adjusted_tbl(:,5);
adjusted_tbl(:,26) = adjusted_tbl(:,26) + adjusted_tbl(:,6);
adjusted_tbl(:,4:6) = 0;