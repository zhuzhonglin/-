package org.ywjava.test;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Map<Integer, Integer> m = new HashMap<>();
		m.put(1, 1);
		m.put(2, 3);
		System.out.println(m);
		Integer i = m.get(2);
		System.out.println(i);
		Integer i2 = m.get(20);
		System.out.println(i2);
		
		Set<Integer> set = m.keySet();
		System.out.println(set);
		
		for(Integer k : set) {
			System.out.println(k + "=" + m.get(k));
		}

	}

}
