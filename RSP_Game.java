import java.util.Random;
import java.util.Scanner;

class RSP_Game {
	private String winner = "computer";
	private int comHand, yourHand;
	private Random rand = new Random();
	private Scanner input = new Scanner(System.in);
	
	private String strHand(int n){
		switch (n){
		case 1: return "가위";
		case 2: return "바위";
		case 3: return "보";
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
				winner ="무승부";
			  else if (comHand == 1) // com: Rock
				  if (yourHand == 2) // you: Scissor
					  winner = "컴퓨터";
				  else  // you : Paper
					  winner = "당신";
			  else if (comHand == 2) //com: Scissor
				  if (yourHand == 1) // you: Rock
					  winner = "당신";
				  else  // you : Paper
					  winner = "컴퓨터";	
			  else if (comHand == 3) // com: Paper
				  if (yourHand == 1) // you: Rock
					  winner = "컴퓨터";
				  else  // you : Scissor
					  winner = "당신";			
	}
	
	private void displayWinner(){
		 if (winner == "당신")
			  System.out.printf("당신 이김! 컴퓨터 짐! (당신:%s, 컴퓨터:%s)\n",strHand(yourHand), strHand(comHand ));
		  if (winner == "컴퓨터")
			  System.out.printf("컴퓨터 이김! 당신 짐! 또 해!! (당신:%s, 컴퓨터:%s)\n",strHand(yourHand), strHand(comHand ) );
		  if (winner == "무승부")
			  System.out.printf("무승부 !또 해!! (당신:%s, 컴퓨터:%s)\n",strHand(yourHand), strHand(comHand ) );	
	}
	
	public void playRSP(){
		while (winner !="당신"){
			  comPlay();
			  youPlay();
			  checkWinner();
              displayWinner();

		}
	}
}

