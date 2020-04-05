#include <stdio.h>

#include <malloc.h>

// 노드의 정의, node, pnode를 정의한다.   

typedef struct _node node;
typedef node* pnode;

// 구조체 노드 정의, 다항식의 계수와 지수를 가진다.
// 다항식의 계수는 double형으로 하였다.

struct _node {
    double coef;   //계수
    int expon;      //지수
    pnode  next;
};

// 한개의 노드를 생성하여 그 노드의 주소를 반환한다.

pnode createNode(double coef, int expon) {
    pnode p = (pnode)malloc(sizeof(node));
    p->coef = coef;
    p->expon = expon;
    p->next = NULL;
    
    return p;
}

// 노드 전체 메모리 해제.
void deleteNode(pnode* root) {

    pnode p = *root;
    pnode next;

    while(p) {
        next=p->next;
        free(p);
        p = next;
    }
    
    *root = NULL;
}
   

// 다항식을 출력한다.

void polyPrint(pnode poly) {

    pnode p = poly;

    if(p->expon>1) {
        if(p->coef==1)
            printf("x%d", p->expon);
        else if(p->coef!=0)
            printf("%gx%d", p->coef, p->expon);
    }
    else if(p->expon==1) {
        if(p->coef==1) printf("x");
        else printf("%gx", p->coef);
    }
    else printf("%g", p->coef);

    p=p->next;

    while(p) {
        while(p->coef==0) {
            p=p->next;
        }

        if(p->coef>0) printf("+");

        if(p->expon>1) {
            if(p->coef==1)
                printf("x%d", p->expon);
            else if(p->coef!=0)
                printf("%gx%d", p->coef, p->expon);
        }
        else if(p->expon==1) {
            if(p->coef==1) printf("x");
            else printf("%gx", p->coef);
        }
        else printf("%g", p->coef);

        p=p->next;
    }

    printf( "\n" );

}

void addNode(pnode *root, double coef, int expon) {

    pnode p = *root;
    pnode prev=NULL;

    // 루트노드가 없으면 루트노드 생성.
    if(*root == NULL) {
        *root = createNode(coef,expon);
        return;

    }
    while(p) {

        if(p->expon==expon) {
            // 계수가 같은것은 차수를 더해준다.
            p->coef += coef;
            if(p->coef==0) {
                // 지금은 아무것도 하지 않는다.
            }
            break;
        }

        else if(p->expon<expon) {
            // 계수가 큰것을 노드앞쪽에 삽입한다.
            pnode nnode = createNode(coef,expon);
            nnode->next = p;
            if(prev) prev->next = nnode;
            else *root = nnode;
            break;

        }

        if(p->next==NULL ) {

            // 이것도 저것도 아니면 마지막 노드에 붙인다.
            pnode nnode=createNode(coef,expon);
            p->next = nnode;
            break;

        }
        prev = p;
        p = p->next;
    }

}



// 두개의 다항식을 더하여 그 결과 다항식을 반환한다.

pnode polyAdd(pnode poly1, pnode poly2) {
    pnode p = NULL;
    pnode p1=poly1;
    pnode p2=poly2;

    while(p1) {
        addNode(&p, p1->coef, p1->expon);
        p1=p1->next;

    }

    while(p2) {

        addNode(&p, p2->coef, p2->expon);
        p2=p2->next;

    }

    return p;

}

// 두개의 다항식을 곱하여 그 결과 다항식을 반환한다.

pnode polyMult(pnode poly1, pnode poly2) {
    pnode p = NULL;
    pnode p1 = poly1;
    pnode p2;

    while(p1) {
        p2=poly2;

        while(p2) {
            // 다항식의 곱셈 : 계수는 곱해주고, 차수는 더해준어 노드를 추가한다.
            addNode(&p, p1->coef*p2->coef, p1->expon + p2->expon);
            p2=p2->next;
        }

        p1=p1->next;
    }

    return p;

}



// 키보드로 부터 입력을 받아서 다항식을 만들어서 반환한다.

pnode createPoly() {
    pnode p = NULL;
    double coef;
    int i, n, expon;

    printf("다항식의 항의 갯수: ");

    scanf("%d", &n);

    for(i=0;i<n;++i) {
        // 계수와 지수를 쌍으로 입력한다.
        // 상수항을 입력할 경우는 지수를 0으로 주어야 한다.
        printf("계수와 지수: ");
        scanf("%lf%d", &coef, &expon);
        addNode(&p, coef, expon);
    }
    return p;

}
   

int main() {

    pnode p1 = NULL;
    pnode p2 = NULL;
    pnode p3 = NULL;
    pnode p4 = NULL;
    
    double x;
    char choice;

    while(1) {
        printf("다항식1 입력\n");
        p1=createPoly();
        printf( "P1(x) = ");
        polyPrint(p1);

        printf("다항식2 입력\n");
        p2=createPoly();
        printf( "P2(x) = ");
        polyPrint(p2);


        // P3(x) = P1(x) + P2(x) 다항식의 덧셈
        p3= polyAdd( p1, p2 );

        // 다항식 출력.
        printf( "P1(x) + p2(x) = ");
        polyPrint(p3);


        // P4(x) = P1(x) * P2(x) 다항식의 곱셈
        p4= polyMult( p1, p2 );

        // 다항식 출력.
        printf( "P1(x) * p2(x) = ");
        polyPrint(p4);

        // 메모리 해제.
        deleteNode(&p1);
        deleteNode(&p2);
        deleteNode(&p3);
        deleteNode(&p4);
        printf("계속하시겠습니까?(y/n) ");
        scanf(" %c", &choice);

        if(choice!='y') break;

    }

    return 0;

}
