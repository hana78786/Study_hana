package org.kh.hellospring;

public class MessageBeanHello implements MessageBean {

	@Override
	public void sayHellow(String name) {
		System.out.println("Hello "+name);
		
	}

}
