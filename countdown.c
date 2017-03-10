int counter=0;

int countdown_at_idx(int* ptr, int idx){
	int numb;
	int red;
	numb=*(ptr+idx);
	red=1;
	if(numb%2==0){
		red=2;
	}
	while(numb>0){
		numb=numb-red;
		counter=counter+1;
	}
	
}

int main(){
	int i;
	int* array;
	array=malloc(20*4);
	i=0;
	while(i<20){
		*(array+i)=i;
		countdown_at_idx(array, i);
		i=i+1;
	}
	return counter;
}
