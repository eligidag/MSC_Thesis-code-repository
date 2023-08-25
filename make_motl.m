projectname='alignment_bin_4_adj2';
iter='0006';
before_or_after_clean='b';
%tomon=64;
list=dir([projectname '_ite_' iter '/TS_*.tbl']);
list={list.name};
for i = 1:length(list)

    tomon=list{1,i};
    tomon=char(extractBetween(tomon,'TS_','.tbl')); % This extracts the tomogram number
    tomon=str2num(tomon);

%dwrite(average.average,'average_bin4_filtered.em');
if before_or_after_clean=='a';
tt=dread([projectname '_ite_' iter '/total_neighbour_cleaned.tbl']);
end
if before_or_after_clean=='b';
tt=dread(['../' projectname '/results/ite_' iter '/averages/refined_table_ref_001_ite_' iter '.tbl']);
end

ttt=tt(tt(:,20)==tomon,:);
ttt(:,24:26)=ttt(:,24:26)+ttt(:,4:6);
ttt(:,4:6)=0;

mm=dynamo__table2motl(ttt);
if before_or_after_clean=='b';
dwrite(mm,[projectname '_ite_' iter '/motl_' num2str(tomon) '_' projectname '_ite_' iter '.em']);
end
if before_or_after_clean=='a';
dwrite(mm,[projectname '_ite_' iter '/motl_' num2str(tomon) '_' projectname '_ite_' iter '_cleaned.em']);
end
end