package com.entities;

import java.io.FileInputStream;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class AdminLogin {

	public static void main(String[] args)throws IOException {
		// TODO Auto-generated method stub
		Configuration cfg=new Configuration();
        cfg.configure("hibernate.cfg.xml");
        SessionFactory factory=cfg.buildSessionFactory();
        
        Admin ad=new Admin();
        ad.setId(1);
        ad.setName("Prasanta");
        ad.setEmail("admin@gmail.com");
        ad.setPassword("1234");
        FileInputStream fis=new FileInputStream("src/main/java/prasanta.jpg");
        byte[] data=new byte[fis.available()];
        fis.read(data);
        ad.setImage(data);
        
        
        Session session=factory.openSession();
        
        Transaction tx=session.beginTransaction();
        
        session.save(ad);
        
        tx.commit();
        
        session.close();
	}

}
