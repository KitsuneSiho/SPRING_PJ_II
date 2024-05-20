package kr.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpringController {
    @GetMapping("test1")
    public String test1() {
        return "test1";
    }
}
