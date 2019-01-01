package com.eva.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


/**
 * 用户表实体类
 * Entity 代表这是实体类，要交给Hibernate管理
 * 。 @Size @NotNull 都是validation框架的注解，更多验证请参见网络资料
 */
@Entity
@Table(name="user")
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id; //主键 自增

    @NotNull(message = "用户名不能为空")
    @Size(min = 6 , max = 18, message = "用户名应设为6至18位")
    @Column(name="username", unique = true, nullable = false)
    private String name; //唯一 非空
    @Column(name="nickname")
	private String nickName;
    @Column(nullable = false)
    @NotNull(message = "密码不能为空")
    @Size(min = 6 , max = 18, message = "密码应设为6至18位")
    private String password; //非空
    
    private Boolean enabled;
	private String email;
	private String userface;
	@Column(name="regtime")
	private String regTime;
	
	protected User() {}
	
	public User(String name, String password) {
		this.name = name;
		this.password = password;
	}
	
	public String toString() {
		return String.format("User[id=%d, user='%s', password='%s']", id, name, password);
	}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserface() {
		return userface;
	}

	public void setUserface(String userface) {
		this.userface = userface;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}