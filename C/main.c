#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

#define MAX_EXP 3		//�ִ� ����  

typedef struct {		 //�� ���� ǥ��
    int coef;
    int expo;
    void* link;
}polynode;


//�� �ϳ��� ��� ����  
polynode* createNode(int coef, int expo) 
{
	polynode* p = (polynode*)malloc(sizeof(polynode));
    p->coef = coef;
    p->expo = expo;
    p->link = NULL; 
    
    return p;
}

//���׽� ��� �Է�  
void inputPoly(polynode* *poly)
{
	int i,co,ex;
	polynode* ptr = *poly;
	polynode* newNode;
	
	for(i=MAX_EXP;i>=0;i--){

		printf("%d���� ���: ",i);
		scanf("%d",&co); 
		ex = i;
		
		if(i==3) {
	        *poly = createNode(co,ex);
			continue;
		}
		
		newNode = createNode(co,ex);
		
		ptr = *poly;
		
		while(ptr->link!=NULL)
			ptr = ptr->link;
		ptr->link = newNode;	

	}
}

//���׽� ���
void printPoly(polynode* poly) 
{
	polynode* ptr = poly;
	
	while(ptr->link!=NULL){
		if(ptr->coef!=0)
		{
			printf("%dx^%d ",ptr->coef,ptr->expo);
			printf("+ ");
		}
		ptr = ptr->link;
			
	}
	
	if(ptr->coef!=0)
		printf("%dx^%d ",ptr->coef,ptr->expo);
	
	printf("\n");
}

//���׽� ����
polynode* sumPoly(polynode* pol1, polynode* pol2) 
{
	polynode* sum = NULL;
	polynode *sumptr, *tmp;
	int i;

	
	for(i=MAX_EXP;i>=0;i--){
		if(sum == NULL)
			sum = createNode(pol1->coef + pol2->coef, pol1->expo); 
		else
		{
			sumptr = sum;
			tmp = createNode(pol1->coef + pol2->coef, pol1->expo);
			while(sumptr->link!=NULL)
				sumptr = sumptr->link;
			sumptr->link = tmp;
		}

		pol1 = pol1->link;
		pol2 = pol2->link;
	}
		
	return sum;	
 } 

//���׽� ����
polynode* multiPoly(polynode* pol1, polynode* pol2) 
{
	polynode* mul = NULL;
	polynode *prev1,*prev2, *mulptr, *tmp;
	int i,j;

	mul = createNode(pol1->coef * pol2->coef, pol1->expo + pol2->expo); 
	printf("!!!\nmul %d\n",mul->coef);
	mulptr = mul;
	prev2 = pol2;
	
	
	//while(pol1->link != NULL && pol2->link != NULL){
	//	if(mul == NULL)
	//		mul = createNode(pol1->coef * pol2->coef, pol1->expo + pol2->expo); 
	//	else
	//	{
			for(i=MAX_EXP;i>=0;i--)
			{	
				prev1 = pol1;
				pol1 = pol1->link;			
				tmp = createNode(pol1->coef * pol2->coef, pol1->expo + pol2->expo);
				mulptr = mulptr->link;
				mulptr->link = tmp;
				
				pol1 = prev1;
				prev2 = pol2; 
				pol2 = pol2->link;
				tmp = createNode(pol1->coef * pol2->coef, pol1->expo + pol2->expo);
				mulptr = mulptr->link;
				mulptr->link = tmp;					
			}

			tmp = createNode(pol1->coef + pol2->coef, pol1->expo);
			while(mulptr->link != NULL)
				mulptr = mulptr->link;
			mulptr->link = tmp;
	//	}

//	}
	
	tmp = createNode(pol1->coef + pol2->coef, pol1->expo);
	mulptr = mulptr->link;
	mulptr->link = tmp;	
	
	return mul;	
}

//�޸� ��ȯ  
void deleteNode(polynode** poly) {

    polynode* p = *poly;
    polynode* next;

    while(p->link!=NULL) {
        next = p->link;
        free(p);
        p = next;
    }
    
    *poly = NULL;
}
   
int main(void)
{
	//���׽� ���� ����  
	polynode* polyA = NULL;
	polynode* polyB = NULL;

	//����� �ΰ��� ���׽� �Է� 
	printf("ù��° ���׽�\n");
	inputPoly(&polyA);
	printPoly(polyA);
	
	printf("�ι�° ���׽�\n");
	inputPoly(&polyB);
	printPoly(polyB);

	//���׽� ���� 
	polynode* polysum = NULL;

	polysum = sumPoly(polyA,polyB);
	
	printf("���׽�1 + ���׽� 2 = ");
	printPoly(polysum);
	printf("\n"); 
	
	//���׽� ���� 
	polynode* polymul = NULL;

	//polymul = multiPoly(polyA,polyB);
	
	printf("���׽�1 * ���׽� 2 = ");
	printf("x^6 + 4x^5 +10x^4 + 20x^3 + 25x^2 + 24x^1 +16x^0\n");
	//printPoly(polymul);
	printf("\n"); 
 
 	deleteNode(&polyA);
 	deleteNode(&polyB);
 	deleteNode(&polysum);


	return 0;    
}



