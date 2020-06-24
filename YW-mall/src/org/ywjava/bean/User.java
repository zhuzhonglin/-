package org.ywjava.bean;

/**
 * CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(18) DEFAULT NULL,
  `PASSWORD` varchar(18) DEFAULT NULL,
  `username` varchar(18) DEFAULT NULL,
  `sex` char(3) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `email` varchar(18) DEFAULT NULL,
  `headPic` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
)
 * */
public class User {
	
	private Integer id;
	private String loginname;
	private String password;
	private String username;
	private String sex;
	private Integer age;
	private String address;
	private String phone;
	private String email;
	private String headPic;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHeadPic() {
		return headPic;
	}
	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	
}
