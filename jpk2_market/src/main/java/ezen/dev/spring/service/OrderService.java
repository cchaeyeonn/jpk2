package ezen.dev.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.OrderDao;
import ezen.dev.spring.vo.OrderVo;

@Service
public class OrderService {
	
	private OrderDao orderDao;
	
	@Autowired
	public OrderService(OrderDao orderDao) {
		this.orderDao = orderDao;
	}


	

}
