package com.ayanami.okoyo.controller;

import com.ayanami.okoyo.entity.*;
import com.ayanami.okoyo.service.ProductService;
import com.ayanami.okoyo.entity.*;
import com.ayanami.okoyo.exception.ProductNotFoundException;
import com.ayanami.okoyo.repository.CategoryRepository;
import com.ayanami.okoyo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.webjars.NotFoundException;

import java.security.Principal;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private CategoryRepository categoryRep;
    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String index(Model model) {
        try {
            model.addAttribute("listProducts", productService.getRandomAmountOfProducts());
        } catch (ProductNotFoundException ex) {
            if (ex != null && ex.getCause() != null) {
                model.addAttribute("error", ex.getCause().getCause().getMessage());
            } else {
                model.addAttribute("error", "An unknown error occurred.");
            }
            return "/error/404";
        }
        return "index";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("userInfo", new UserInfo());
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(User user, UserInfo userInfo) {
        user.setRole(Role.USER);
        user.setUserInfo(userInfo);
        userInfo.setUser(user);
        userService.saveUser(user);
        return "redirect:/";
    }

    @GetMapping("/basket")
    public String showShoppingCard(Model model,
                                   Principal principal) {
        if (principal != null) {
            List<OrderBasket> orderBaskets = userService.getUserByLogin(principal.getName()).getOrderBaskets();
            model.addAttribute("orderBaskets", orderBaskets);
            model.addAttribute("order", new Order());
        } else {
            model.addAttribute("error", new NotFoundException("Order basket was not found"));
            return "/error/404";
        }
        return "shopping-cart";
    }

    @GetMapping("/category")
    public String showCategories(Model model) {
        List<Category> listEnabledCategories = categoryRep.findAllEnabled();
        model.addAttribute("listCategories", listEnabledCategories);
        return "category";
    }

}
