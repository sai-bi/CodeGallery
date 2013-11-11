i = 1;
while(i < 10){
	for(j = 1;j < i;j = j + 1;){
		if(j > 5)
			continue;	
		print j;
	}
	i = i + 1;
}
