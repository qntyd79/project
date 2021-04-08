package com.company.bbs.utill;

import nl.captcha.text.producer.TextProducer;

public class SetTextProducer implements TextProducer {
    private final String _getAnswer;
    public SetTextProducer(String getAnswer){
        _getAnswer = getAnswer;
        
    }
 
    @Override
    public String getText() {
        return _getAnswer;
    }
 
}


