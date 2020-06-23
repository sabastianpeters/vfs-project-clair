/*
    Copyright (C) 2020 Itzel Salvador

    Wrapper for output test functionality
*/

class OutputText {

    static String value = 'none';

    getValue(){

      return value;

    }

    setValue(String newValue){
        value = newValue;
    }

    appendLetter(String letter){

        if(value[value.length-1] != letter)
            value = value + letter;
    }
    
}