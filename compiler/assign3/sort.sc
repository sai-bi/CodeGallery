a[] = {100,20,90,30,40,9,2000,50,4000,111};
c = 0;
d = 0;
while(1){
	c = 0;
	for(j = 0;j<9;j=j+1;){
		if(a[j] > a[j+1]){
			d = a[j];
			a[j] = a[j+1];
			a[j+1] = d;
			c = 1;
		}	
	}	
	if(c == 0)
		break;
}

for(i = 0;i < 10;i=i+1;){
	print a[i];
}

//sort elements in array
