package com.whatever.web.controller;


import com.whatever.persistence.Employee;
import com.whatever.persistence.EmployeeRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class WSController {
    private static final Logger log = Logger.getLogger(WSController.class);

    @Autowired
    EmployeeRepository repository;

    @RequestMapping("/ws.wassup")
    @ResponseBody
    public List<Employee> employee(@RequestParam(value = "dept", required = false) String dept) {
        List<Employee> employees;

        if (dept == null) {
            employees = repository.findAll();
        } else {
            employees = repository.findByDept(dept);
        }
        log.debug("found " + employees.size() + " results;");

        return employees;
    }

}
