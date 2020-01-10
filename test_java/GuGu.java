package test_java;

public class GuGu {
    int dan;

    public GuGu(int dan) {
        this.dan = dan;
    }

    public int get(int seq) {
        return this.dan * seq;
    }

    public int[] all() {
        int[] result = new int[9];
        for(int i=0; i<9; i++) {
            result[i] = this.get(i+1);
        }
        return result;
    }

//    public String toString() {
//        StringBuffer sb = new StringBuffer();
//        int[] result = all();
//        for(int i=0;i<result.length; i++) {
//            sb.append(result[i]);
//            if(i!=result.length-1) {
//                sb.append(",");
//            }
//        }
//        return sb.toString();
//    }

    public static void main(String[] args) {
        GuGu gugu = new GuGu(2);
        System.out.println(gugu.get(3));
        System.out.println(gugu);
//        for(int i=2; i<10; i++) {
//            System.out.println(new GuGu(i));
//        }
    }
}