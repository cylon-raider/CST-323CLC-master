package com.gcu.clc.controller;

import com.gcu.clc.business.ProductBusinessService;
import com.gcu.clc.model.ProductModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductBusinessService productBusinessService;

    @GetMapping("/")
    public ModelAndView display(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("title", "Product Page");
        modelAndView.addObject("products", productBusinessService.getAll());
        modelAndView.setViewName("products");
        return modelAndView;
    }

    @GetMapping("/add")
    public ModelAndView displayAddProducts(){
        ModelAndView modelAndView = new ModelAndView();
        ProductModel productModel = new ProductModel();
        modelAndView.addObject("title", "Add Product Page");
        modelAndView.addObject("productModel", productModel);
        modelAndView.setViewName("addProduct");
        return modelAndView;
    }

    @GetMapping("/update")
    public ModelAndView displayEditProducts(){
        ModelAndView modelAndView = new ModelAndView();
        ProductModel productModel = new ProductModel();
        modelAndView.addObject("title", "Edit Product Page");
        modelAndView.addObject("productModel", productModel);
        modelAndView.setViewName("updateProduct");
        return modelAndView;
    }

    @GetMapping("/delete")
    public ModelAndView displayDeleteProducts(){
        ModelAndView modelAndView = new ModelAndView();
        ProductModel productModel = new ProductModel();
        modelAndView.addObject("title", "Delete Product Page");
        modelAndView.addObject("productModel", productModel);
        modelAndView.setViewName("deleteProduct");
        return modelAndView;
    }

    @PostMapping("/addProduct")
    public ModelAndView addProduct(@Valid ProductModel productModel, BindingResult bindingResult, Model model){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("addProduct");
        if(bindingResult.hasErrors()){
            model.addAttribute("title", "Add Product Page");
            return modelAndView;
        }
        if(productBusinessService.addProduct(productModel)){
            return this.display();
        }else {
            return modelAndView;
        }
    }

    @PostMapping("/updateProduct")
    public ModelAndView updateProduct(@Valid ProductModel productModel, BindingResult bindingResult, Model model){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("updateProduct");
        if(bindingResult.hasErrors()){
            model.addAttribute("title", "Add Product Page");
            return modelAndView;
        }
        if(productBusinessService.updateProduct(productModel)){
            return this.display();
        }else {
            return modelAndView;
        }
    }

    @PostMapping("/deleteProduct")
    public ModelAndView deleteProduct(ProductModel productModel) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("deleteProduct");

        if(productBusinessService.deleteProduct(productModel))
        {
            return this.display();
        } else {
            return modelAndView;
        }
    }
}
