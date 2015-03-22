package com.whatever;

import com.whatever.config.CoreConfig;
import com.whatever.config.WebConfig;
import com.whatever.persistence.EmployeeRepository;
import junit.framework.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CoreConfig.class, WebConfig.class})
public class SpringAppTests {

    @Autowired
    EmployeeRepository repository;

    @Test
    public void testJPARepository() {
        Assert.assertFalse(repository.findAll().isEmpty());

        Assert.assertFalse(repository.findByDept("A").isEmpty());
        Assert.assertFalse(repository.findByDept("B").isEmpty());
        Assert.assertTrue(repository.findByDept("C").isEmpty());
    }
}
