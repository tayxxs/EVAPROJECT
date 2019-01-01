package com.eva.controller;

import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.eva.entities.RestResult;
import com.eva.entities.User;
import com.eva.service.UserService;
import com.eva.utils.ResultGenerator;

@RestController
@RequestMapping("/user")
@Validated
public class UserController {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	private final UserService userService;
	private final ResultGenerator generator;
	
	@Autowired
	public UserController(UserService userService, ResultGenerator generator) {
		this.userService = userService;
		this.generator = generator;
	}
	
	@ResponseBody
	@RequestMapping("/register")
	public RestResult register(@Valid User user, BindingResult bindingResult) {
		return generator.getSuccessResult("用户注册成功", userService.saveUser(user));
	}
	
	 /**
     * 匹配 /user/login 地址 ,限定POST方法
     * 。@NotNull 在字段前添加注解代表验证该字段，如果为空则报异常
     * @return 登陆成功则返回相关信息，否则返回错误提示
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public RestResult login(@NotNull(message = "用户名不能为空") String name,@NotNull(message = "密码不能为空") String password, HttpSession session) {
        User user = userService.checkLogin(name, password);
        if(user != null) {
            //储存到session中
            session.setAttribute("user",user);
            return generator.getSuccessResult("登陆成功",user);
        }
        return generator.getFailResult("用户名/密码错误");
    }
	
	  /**
     * 为参数验证添加异常处理器
     */
    @ExceptionHandler(ConstraintViolationException.class)
    public RestResult handleConstraintViolationException(ConstraintViolationException cve) {
        //这里简化处理了，cve.getConstraintViolations 会得到所有错误信息的迭代，可以酌情处理
        String errorMessage = cve.getConstraintViolations().iterator().next().getMessage();
        return generator.getFailResult(errorMessage);
    }

    /**
     * 主键/唯一约束违反异常
     */
    @ExceptionHandler(DataIntegrityViolationException.class)
    public RestResult handleDataIntegrityViolationException(DataIntegrityViolationException exception) {
        //如果注册两个相同的用户名到报这个异常
        return generator.getFailResult("违反主键/唯一约束条件");
    }
}
