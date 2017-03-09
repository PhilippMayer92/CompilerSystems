int counter=0;

int countdown_at_idx(int* ptr, int idx){
	int numb=*(ptr+idx);
	int red;
	if(numb%2==0){
		red=2;
	}else{
		red=1;
	}
	while(numb>0){
		numb=numb-red;
		counter=counter+1;
	}
	
}

int main(){
	int i=0;
	int* array=malloc(20*4);
	while(i<20){
		*(array+i)=i;
		countdown_at_idx(array, i);
		i=i+1;
	}
	return counter;
}
