
projectname='alignment_bin_4_adj2';
iter='0006';

table=dread(['../' projectname '/results/ite_' iter '/averages/refined_table_ref_001_ite_' iter '.tbl']);

tomon_list = unique(table(:,20));
for i = 1:length(tomon_list)
    tomon=tomon_list(i)
    str_tomon = num2str(tomon)
    
    write_table = table(table(:,20) == tomon, :);
    
    dwrite(write_table,[projectname '_ite_' iter '/TS_' str_tomon '.tbl']);

end
