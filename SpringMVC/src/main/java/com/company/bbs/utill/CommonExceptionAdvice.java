package com.company.bbs.utill;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CommonExceptionAdvice {

    private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

    @ExceptionHandler(Exception.class)
    public ModelAndView commonException(Exception e) {
    	
        logger.info(e.toString());
        
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/error");
        mav.addObject("exception", e);        

        return mav;
    }
    
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handle404(NoHandlerFoundException ex) {
    	
    	logger.info(ex.toString());
        
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/errorpage");
        mav.addObject("exception", ex); 
        mav.addObject("code", 404);        

        return mav;
    }

}

