import java.util.Random;
import java.util.Scanner;

class RSP_Game {
	private String winner = "computer";
	private int comHand, yourHand;
	private Random rand = new Random();
	private Scanner input = new Scanner(System.in);
	
	private String strHand(int n){
		switch (n){
		case 1: return "����";
		case 2: return "����";
		case 3: return "��";
		default : return "";
		}		
	}
	
	private void comPlay() {
		  comHand = rand.nextInt(3)+1;
	}
	private void youPlay() {
		  System.out.print("Input Rock(1), Scissor(2), Paper(3) : ");
		  yourHand = input.nextInt();
		  while (yourHand > 3  || yourHand < 1 ){
			  System.out.println("Input Again.. ");
			  System.out.print("Input Rock(1), Scissor(2), Paper(3) : ");
			  yourHand = input.nextInt();
		  }
	}
	
	private void checkWinner(){
		  if (comHand == yourHand)
				winner ="���º�";
			  else if (comHand == 1) // com: Rock
				  if (yourHand == 2) // you: Scissor
					  winner = "��ǻ��";
				  else  // you : Paper
					  winner = "���";
			  else if (comHand == 2) //com: Scissor
				  if (yourHand == 1) // you: Rock
					  winner = "���";
				  else  // you : Paper
					  winner = "��ǻ��";	
			  else if (comHand == 3) // com: Paper
				  if (yourHand == 1) // you: Rock
					  winner = "��ǻ��";
				  else  // you : Scissor
					  winner = "���";			
	}
	
	private void displayWinner(){
		 if (winner == "���")
			  System.out.printf("��� �̱�! ��ǻ�� ��! (���:%s, ��ǻ��:%s)\n",strHand(yourHand), strHand(comHand ));
		  if (winner == "��ǻ��")
			  System.out.printf("��ǻ�� �̱�! ��� ��! �� ��!! (���:%s, ��ǻ��:%s)\n",strHand(yourHand), strHand(comHand ) );
		  if (winner == "���º�")
			  System.out.printf("���º� !�� ��!! (���:%s, ��ǻ��:%s)\n",strHand(yourHand), strHand(comHand ) );	
	}
	
	public void playRSP(){
		while (winner !="���"){
			  comPlay();
			  youPlay();
			  checkWinner();
              displayWinner();

		}
	}
}

