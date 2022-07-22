package ezen.dev.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.OrderDao;

@Service
public class OrderService {
	
	private OrderDao OrderDao;
	
	@Autowired
	public OrderService(OrderDao orderDao) {
		this.OrderDao = orderDao;
	}
	

}
