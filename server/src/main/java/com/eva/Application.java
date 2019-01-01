package com.eva;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import com.eva.entities.User;
import com.eva.repository.UserRepository;

@SpringBootApplication
public class Application {
	private static final Logger logger = LoggerFactory.getLogger(Application.class);
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
		logger.info("SpringBoot server started on port:8080");
	}
	
	//增加一个SpringMVC的DispatcherServlet，接收前台/api开头的请求
    @Bean
    public ServletRegistrationBean apiV1ServletBean(WebApplicationContext wac) {
        DispatcherServlet servlet = new DispatcherServlet(wac);
        ServletRegistrationBean bean = new ServletRegistrationBean(servlet, "/api/*");
        bean.setName("ApiServlet");
        return bean;
    }
    
    /*z
    public CommandLineRunner demo(UserRepository repository) {
    	return (args) -> {
    		// save a couple of users
    		repository.save(new User("user1", "nick1"));
    		repository.save(new User("user2", "nick2"));
    		
    		logger.info("User found with findAll():");
    		logger.info("---------------------------");
    		for (User user : repository.findAll()) {
    			logger.info(user.toString());
    		}
    		logger.info("");
    		
    		// fetch an individual user by ID
    		repository.findById(1L).
    			.ifPresent(user -> {
    				logger.info("User found with findById(1L):");
    				logger.info("-----------------------------");
    				logger.info(user.toString());
    				logger.info("");
    			});
    		
			// fetch customers by last name
			logger.info("User found with findByUser('user1'):");
			logger.info("--------------------------------------------");
			repository.findByUser("user1").forEach(user -> {
				logger.info(user.toString());
			});
			logger.info("");
    	};
    }*/
}
