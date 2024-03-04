package ch05_pjt_03.contact.service;

import org.springframework.beans.factory.annotation.Autowired;

import ch05_pjt_03.contact.ContactSet;
import ch05_pjt_03.contact.dao.ContactDao;

public class ContactSearchService {
	@Autowired(required=false)
    //@Qualifier("qualifierDao")
	private ContactDao contactDao;

	public ContactSet searchContact(String name) {
		if (verify(name)) {
			return contactDao.select(name);
		} else {
			System.out.println("Contact information is available.");
		}

		return null;
	}

	public boolean verify(String name) {
		ContactSet contactSet = contactDao.select(name);
		return contactSet != null ? true : false;
	}


	//@Resource
	public void setContactDao(ContactDao contactDao) { 
		this.contactDao	= contactDao; 
	}
	 

}
