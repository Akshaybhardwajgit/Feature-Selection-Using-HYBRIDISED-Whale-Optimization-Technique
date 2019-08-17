function total_fitness_value=fit(dim)
myfile=pd.read_csv('heart_attack.csv');
total_fitness_value=0;
count=0
lst=[1,2,5,6,8,9,10,11,12]
for row=myfile.rows
	 count+=1;
     original_value=0;
     applied_value=0;
    
	for column=0:size(row)
		
		if coloum in lst
			normalized=100
		else
			normalized=1
			
     
		 original_value=original_value+row[coloum]*normalized;
         applied_value=applied_value+row[coloum]*dim[coloum]*normalized;
     
	 end
	 
     diff=original_value-applied_value;
     fitness_value=diff/original_value;
     total_fitness_value=total_fitness_value+fitness_value;

end
total_fitness_value=total_fitness_value/count;
return  total_fitness_value
    