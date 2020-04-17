package com.chaitu.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chaitu.model.DataTable;

@Repository
@Transactional
public class DbServiceDaoImpl implements DbServiceDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void addConfession(DataTable data) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(data);
	}

	@SuppressWarnings("unchecked")
	public List<DataTable> readAllConfession() {
		List<DataTable> li =   this.sessionFactory.getCurrentSession().createQuery("FROM data d").list();
		Collections.reverse(li);
		return li;	 
		//order by date(date) desc
	}
	
	@SuppressWarnings("unchecked")
	public List<DataTable> readConfessionByArea(String area) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Query query=session.createQuery("from data as d WHERE d.area= :ar");
				    query.setParameter("ar", area);
			return query.list();
		}catch(Exception e) {System.out.println("-----readConfessionByArea-----"+e);}
		return null;
	}
 
	@SuppressWarnings("unchecked")
	public List<DataTable> readallAreas() {
		return (List<DataTable>) this.sessionFactory.getCurrentSession().createQuery("SELECT dd.area FROM data dd").list();
	}

	/*
	 * public void addEmployee(Employee employee) {
	 * sessionFactory.getCurrentSession().saveOrUpdate(employee); }
	 * 
	 * @SuppressWarnings("unchecked") public List<Employee> listEmployeess() {
	 * return (List<Employee>)
	 * sessionFactory.getCurrentSession().createCriteria(Employee.class).list(); }
	 * 
	 * public Employee getEmployee(int empid) { return (Employee)
	 * sessionFactory.getCurrentSession().get(Employee.class, empid); }
	 * 
	 * public void deleteEmployee(Employee employee) {
	 * sessionFactory.getCurrentSession().
	 * createQuery("DELETE FROM Employee WHERE empid = "+employee.getEmpId()).
	 * executeUpdate(); }
	 */
}
