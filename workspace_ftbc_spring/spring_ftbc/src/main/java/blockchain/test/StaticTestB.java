package blockchain.test;

import java.util.Vector;

public class StaticTestB {
	public static void main(String[] args) {
		StaticTestA sta = new StaticTestA();
		sta.list = new Vector<String>();
		sta.list.add("가");
		StaticTestA sta2 = new StaticTestA();
		sta2.list.add("나");
		StaticTestA sta3 = new StaticTestA();
		sta3.list.add("다");
		System.out.println("sta : "+sta.list);
		System.out.println("sta2 : "+sta2.list);
		System.out.println("sta3 : "+sta3.list);
	}
}
