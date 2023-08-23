package org.cunoc;

import java_cup.runtime.*;

%%
%public
%class MyLexer
%cup

/* Macros */
digit = [0-9]+
letter = [a-zA-Z]
whiteSpace = [ \t\n\r\f]
id = {letter}({letter}|{digit})*
number = [0-9]+(\.[0-9]+)?

%{
    StringBuffer sb = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%eofval{
    return new Symbol(MyParserSym.EOF);
%eofval}

%%

/* Lexical Rules */
{number}                   { return symbol(MyParserSym.NUM, Double.valueOf(yytext())); }
{id}                       { return symbol(MyParserSym.ID, yytext()); }
"("                        { return symbol(MyParserSym.LPAREN, yytext()); }
")"                        { return symbol(MyParserSym.RPAREN, yytext()); }
"="                        { return symbol(MyParserSym.EQUALS, yytext()); }
"+"                        { return symbol(MyParserSym.PLUS, yytext()); }
"-"                        { return symbol(MyParserSym.MINUS, yytext()); }
"*"                        { return symbol(MyParserSym.MULT, yytext()); }
"/"                        { return symbol(MyParserSym.DIV, yytext()); }
";"                        { return symbol(MyParserSym.SEMICOLON, yytext()); }
{whiteSpace}+              { /* ignore */ }
.                          { System.err.println("Illegal character: " + yytext()); }

