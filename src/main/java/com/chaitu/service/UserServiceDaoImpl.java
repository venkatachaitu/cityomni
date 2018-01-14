package com.chaitu.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chaitu.model.Data;

@Repository
@Transactional
public class UserServiceDaoImpl implements UserServiceDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void addConfession(Data data) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(data);
	}

	@SuppressWarnings("unchecked")
	public List<Data> readAllConfession() {
		List<Data> li =   this.sessionFactory.getCurrentSession().createQuery("from Data order by date(date) desc ").list();
		Collections.reverse(li);
		return li;	 
	}
	
	public List<Data> readConfessionByArea(String area) {
		return null;//(List<Data>) this.sessionFactory.getCurrentSession().createCriteria("FROM Data where area = "+area).list(); 
	}
 
	@SuppressWarnings("unchecked")
	public List<Data> readallAreas() {
		return (List<Data>) this.sessionFactory.getCurrentSession().createQuery("select d.area FROM Data d").list();
	}

		/*public void addEmployee(Employee employee) {
		   sessionFactory.getCurrentSession().saveOrUpdate(employee);
		 }

		 @SuppressWarnings("unchecked")
		 public List<Employee> listEmployeess() {
		  return (List<Employee>) sessionFactory.getCurrentSession().createCriteria(Employee.class).list();
		 }

		 public Employee getEmployee(int empid) {
		  return (Employee) sessionFactory.getCurrentSession().get(Employee.class, empid);
		 }

		 public void deleteEmployee(Employee employee) {
		  sessionFactory.getCurrentSession().createQuery("DELETE FROM Employee WHERE empid = "+employee.getEmpId()).executeUpdate();
		 }*/
}
