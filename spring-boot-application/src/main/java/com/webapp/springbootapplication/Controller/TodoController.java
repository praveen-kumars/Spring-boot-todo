package com.webapp.springbootapplication.Controller;

import com.webapp.springbootapplication.model.Todo;
import com.webapp.springbootapplication.service.TodoRepository;
import com.webapp.springbootapplication.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class TodoController {

    @Autowired
    TodoService service;

    @Autowired
    TodoRepository repository;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                dateFormat, false));
    }

    @RequestMapping(value = "/list-todos",method = RequestMethod.GET)
    public String showLogin(ModelMap model)
    {
        String search= getLoggedInUserName(model);
        model.put("todos",repository.findByUser(search));
        //model.put("todos",service.retrieveTodos(search));
        return "list-todos";
    }

    private String getLoggedInUserName(ModelMap model) {
        return (String) model.get("name");
    }

    @RequestMapping(value = "/add-todo",method = RequestMethod.GET)
    public String showaddTodo(ModelMap model)
    {
        model.addAttribute("todo",new Todo(0, getLoggedInUserName(model),"",new Date(),false));
        return "todo";
    }


    @RequestMapping(value = "/delete-todo",method = RequestMethod.GET)
    public String deleteTodo(@RequestParam int id)
    {

        repository.deleteById(id);
        //service.deleteTodo(id);
        return "redirect:/list-todos";
    }

    @RequestMapping(value = "/add-todo",method = RequestMethod.POST)
    public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result) {

        if(result.hasErrors()){
            return "todo";
        }
        todo.setUser(getLoggedInUserName(model));
        repository.save(todo);
        //service.addTodo(getLoggedInUserName(model),todo.getDesc(), new Date(),
               // false);
        return "redirect:/list-todos";
    }
    @RequestMapping(value = "/update-todo",method = RequestMethod.GET)
    public String updateTodo(@RequestParam int id,ModelMap model)
    {

        Todo todo=repository.findById(id).get();
       //Todo todo=service.retrieveTodos(id);
        model.put("todo",todo);

        return "todo";
    }
    @RequestMapping(value = "/update-todo",method = RequestMethod.POST)
    public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result)
    {

        if (result.hasErrors()) {
            return "todo";
        }

        todo.setUser(getLoggedInUserName(model));

        repository.save(todo);
        //service.updateTodo(todo);

        return "redirect:/list-todos";
    }


}
