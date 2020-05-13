package com.chaitu.service;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import java.util.stream.Collectors;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chaitu.model.DataTable;
import com.chaitu.model.UserLogin;
import com.chaitu.model.UserPosts;

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

	@Override
	public boolean registerUser(UserLogin user) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			session.save(user);
			return true;
		}catch(Exception e) {
			System.out.println("-----registerUser-----"+e);
			return false;
		}
	}

	@Override
	public UserLogin loginUser(UserLogin user) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String hql="from userlogin WHERE userName=:username and password=:password";
			 Query query = session.createQuery(hql);
			 query.setParameter("username", user.getUserName());
	         query.setParameter("password", user.getPassword());
	         query.setMaxResults(1);
	         UserLogin user1 = (UserLogin) query.uniqueResult();
			return user1;
			//return session.get(UserLogin.class, user.getUserName());
		}catch(Exception e) {
			System.out.println("-----loginUser-----"+e);
			return null;
		}
	}

	@Override
	public UserLogin getUser(String userName) {
		Session session = this.sessionFactory.getCurrentSession();
		return session.get(UserLogin.class, userName);
	}

	@Override
	public UserLogin updateUser(UserLogin user) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Object o=session.load(UserLogin.class, user.getUserName());
			UserLogin u = (UserLogin)o;
			u.setMobileNo(user.getMobileNo());
			u.setEmail(user.getEmail());
			u.setDob(user.getDob());
			u.setGender(user.getGender());
			u.setCity(user.getCity());
			u.setCountry(user.getCountry());
			u.setPin(user.getPin());
			u.setPrivateFields(user.getPrivateFields());
			u.setActiveStatus(user.getActiveStatus());
			session.update(u);
			
			user.setRegistrationDate(u.getRegistrationDate());
			user.setActiveStatus(u.getActiveStatus());
			return user;
		}catch(Exception e) {
			System.out.println("-----loginUser-----"+e);
			return null;
		}
	}

	@Override
	public String lastLoginTimeUpdate(String userName, String string) {
		String lastLoginTime = "";
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Object o=session.load(UserLogin.class, userName);
			UserLogin u = (UserLogin)o;
			lastLoginTime = u.getLastLogin();
			u.setLastLogin(string);
			session.update(u);
		}catch(Exception e) {
			System.out.println("-----lastLoginTimeUpdate-----"+e);
		}
		return lastLoginTime;
	}

	@Override
	public boolean addUserPost(UserPosts post) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			post.setPostId(new Date().toString().replaceAll(" ", "")+""+post.getuserName());
			post.setDateTime(new Date().toString());
			post.setPrivacy("public");
			session.save(post);
			return true;
		}catch(Exception e) {
			System.out.println("-----addUserPost-----"+e);
		}
		return false;
	}

	@Override
	public List<UserPosts> readAllPosts(String user) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			String hql="FROM userPosts WHERE userName=:username order by dateTime desc";
			 Query query = session.createQuery(hql);
			 query.setParameter("username", user);
			return query.list();
		}catch(Exception e) {
			System.out.println("-----readAllPosts-----"+e);
			return null;
		}
	}

	@Override
	public void likeUser(String postId, String userName) {
		try {
			String finalUsers = "";
			Session session = this.sessionFactory.getCurrentSession();
			Object o=session.load(UserPosts.class, postId);
			UserPosts u = (UserPosts)o;
			if(u.getLikeUsers() != null) {
				String existedUsers = u.getLikeUsers();
				if(existedUsers.contains(userName)) {
					u.setLikeUsers(existedUsers.replace(userName, ""));
				}else {
					u.setLikeUsers(u.getLikeUsers()+","+userName);
				}
				if(u.getLikeUsers() != null && !u.getLikeUsers().isEmpty()) {
					String arr[] = u.getLikeUsers().split(",");
					for(String st : arr){
					    if(!st.isEmpty())
					    	finalUsers += st+",";
					}
				}
			}else {
				u.setLikeUsers(userName);
			}
			u.setLikeUsers(finalUsers);
			session.update(u);
		}catch(Exception e) {
			System.out.println("-----likeUser-----"+e);
		} 
	}

	@Override
	public void updatePrivacy(String postId, String userName, String privacy) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Object o=session.load(UserPosts.class, postId);
			UserPosts u = (UserPosts)o;
			u.setPrivacy(privacy);
			session.update(u);
		}catch(Exception e) {
			System.out.println("-----updatePrivacy-----"+e);
		} 
	}

	@Override
	public List<String> findFriends(String value) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(UserLogin.class);
			criteria.add(Restrictions.like("userName", value, MatchMode.ANYWHERE));
			List<UserLogin> list =  criteria.list();
			return (List<String>) list.stream().map(u->u.getUserName()).collect(Collectors.toList());
		}catch(Exception e) {
			System.out.println("-----findFriends-----"+e);
			return null;
		}
	}

	@Override
	public UserLogin viewSearchProfile(String userName) {
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Object o=session.get(UserLogin.class, userName);
			UserLogin userLogin = (UserLogin)o;
			if(userLogin.getActiveStatus().equalsIgnoreCase("true"))
				return userLogin;
		}catch(Exception e) {
			System.out.println("-----viewSearchProfile-----"+e);
			return null;
		}
		return null;
	}

}


















