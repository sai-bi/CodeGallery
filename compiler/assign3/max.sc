a[] = {0,0,0,0,0};
read a[0];
read a[1];
read a[2];
read a[3];
read a[4];

m = -1;

for(i = 0;i < 5;i=i+1;){	
	if(a[i] > m)
		m = a[i];
}

print m;
//find max element in array
