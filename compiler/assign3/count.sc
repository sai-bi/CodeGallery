a[] = {
4,	1,	5,	1,	3,
1,	3,	5,	1,	4,
3,	1,	4,	2,	2,
1,	4,	4,	5,	2	
};

b[] = {0,0,0,0,0};
i = 0;
while(i < 20){
	b[a[i]-1] = b[a[i]-1] + 1;
	i = i + 1;	
}

i = 0;
do{
	print b[i];
	i = i + 1;	
}while(i < 5);

//count the frequency of each number 

