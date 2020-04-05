#include <stdio.h>

#include <malloc.h>

// ����� ����, node, pnode�� �����Ѵ�.   

typedef struct _node node;
typedef node* pnode;

// ����ü ��� ����, ���׽��� ����� ������ ������.
// ���׽��� ����� double������ �Ͽ���.

struct _node {
    double coef;   //���
    int expon;      //����
    pnode  next;
};

// �Ѱ��� ��带 �����Ͽ� �� ����� �ּҸ� ��ȯ�Ѵ�.

pnode createNode(double coef, int expon) {
    pnode p = (pnode)malloc(sizeof(node));
    p->coef = coef;
    p->expon = expon;
    p->next = NULL;
    
    return p;
}

// ��� ��ü �޸� ����.
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
   

// ���׽��� ����Ѵ�.

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

    // ��Ʈ��尡 ������ ��Ʈ��� ����.
    if(*root == NULL) {
        *root = createNode(coef,expon);
        return;

    }
    while(p) {

        if(p->expon==expon) {
            // ����� �������� ������ �����ش�.
            p->coef += coef;
            if(p->coef==0) {
                // ������ �ƹ��͵� ���� �ʴ´�.
            }
            break;
        }

        else if(p->expon<expon) {
            // ����� ū���� �����ʿ� �����Ѵ�.
            pnode nnode = createNode(coef,expon);
            nnode->next = p;
            if(prev) prev->next = nnode;
            else *root = nnode;
            break;

        }

        if(p->next==NULL ) {

            // �̰͵� ���͵� �ƴϸ� ������ ��忡 ���δ�.
            pnode nnode=createNode(coef,expon);
            p->next = nnode;
            break;

        }
        prev = p;
        p = p->next;
    }

}



// �ΰ��� ���׽��� ���Ͽ� �� ��� ���׽��� ��ȯ�Ѵ�.

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

// �ΰ��� ���׽��� ���Ͽ� �� ��� ���׽��� ��ȯ�Ѵ�.

pnode polyMult(pnode poly1, pnode poly2) {
    pnode p = NULL;
    pnode p1 = poly1;
    pnode p2;

    while(p1) {
        p2=poly2;

        while(p2) {
            // ���׽��� ���� : ����� �����ְ�, ������ �����ؾ� ��带 �߰��Ѵ�.
            addNode(&p, p1->coef*p2->coef, p1->expon + p2->expon);
            p2=p2->next;
        }

        p1=p1->next;
    }

    return p;

}



// Ű����� ���� �Է��� �޾Ƽ� ���׽��� ���� ��ȯ�Ѵ�.

pnode createPoly() {
    pnode p = NULL;
    double coef;
    int i, n, expon;

    printf("���׽��� ���� ����: ");

    scanf("%d", &n);

    for(i=0;i<n;++i) {
        // ����� ������ ������ �Է��Ѵ�.
        // ������� �Է��� ���� ������ 0���� �־�� �Ѵ�.
        printf("����� ����: ");
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
        printf("���׽�1 �Է�\n");
        p1=createPoly();
        printf( "P1(x) = ");
        polyPrint(p1);

        printf("���׽�2 �Է�\n");
        p2=createPoly();
        printf( "P2(x) = ");
        polyPrint(p2);


        // P3(x) = P1(x) + P2(x) ���׽��� ����
        p3= polyAdd( p1, p2 );

        // ���׽� ���.
        printf( "P1(x) + p2(x) = ");
        polyPrint(p3);


        // P4(x) = P1(x) * P2(x) ���׽��� ����
        p4= polyMult( p1, p2 );

        // ���׽� ���.
        printf( "P1(x) * p2(x) = ");
        polyPrint(p4);

        // �޸� ����.
        deleteNode(&p1);
        deleteNode(&p2);
        deleteNode(&p3);
        deleteNode(&p4);
        printf("����Ͻðڽ��ϱ�?(y/n) ");
        scanf(" %c", &choice);

        if(choice!='y') break;

    }

    return 0;

}
