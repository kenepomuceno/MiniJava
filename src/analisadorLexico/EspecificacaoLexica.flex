package analisadorLexico;
import analisadorSintatico.Symbols.java

%% 

%public
%class AnalisadorLexico
%unicode
%line
%column

%{
	private ComplexSymbolFactory symbolFactory;
	public Lexer (File file, ComplexSymbolFactory symbolFactory) throws IOException {
		this(new BufferedReader(new InputStreamReader(new FileInputStream(file))));
		this.sybolFactory = symbolFactory;
	}
}%

%eofval{
	return symbolFactory.newSymbol("EOF", EOF);
%eofval}


identificador = (_|[A-Za-z])(_|[A-Za-z]|[0-9])*
espaco = [ \n\t\r\f]
inteiro = 0|"-"?([1-9][0-9]*) 
"+" | "-" | "*" | "/" | "%" | "!" | "&&" | "||" | "==" | "!=" | "<" | "<=" | ">" | ">="
delimitadores = ";" | "." | "," | "(" | ")" | "{" | "}" | "[" | "]" | "=" 
palavreservadas = "public" | "class" | "extends" | "static" | "void" | "boolean" | "main" | "String" | "int" | "while" | "if" | "else" | "return" | "length" | "true" | "false" | "this" | "new" | "System.out.println"
comentarios = "//".|"/*"([^"*"]|[\r\n]|("*"+([^"*/"]|[\r\n])))*"*"+"/"

%%

{identificador} { return symbolFactory.newSymbol(yytext(), IDENTIFICADOR); }
{inteiro} { return symbolFactory.newSymbol(yytext(), NUMERO); }

"+" { return symbolFactory.newSymbol(yytext(), SOMA); }
"-" { return symbolFactory.newSymbol(yytext(), SUBTRACAO); }
"*" { return symbolFactory.newSymbol(yytext(), MULTIPLICACAO); }
"/" { return symbolFactory.newSymbol(yytext(), DIVISAO); }
"%" { return symbolFactory.newSymbol(yytext(), RESTO); }
"!" { return symbolFactory.newSymbol(yytext(), NEGACAO); }
"&&" { return symbolFactory.newSymbol(yytext(), E); }
"||" { return symbolFactory.newSymbol(yytext(), OU); }
"==" { return symbolFactory.newSymbol(yytext(), IGUAL); }
"!=" { return symbolFactory.newSymbol(yytext(), DIFERENTE); }
"<" { return symbolFactory.newSymbol(yytext(), MENOR); }
"<=" { return symbolFactory.newSymbol(yytext(), MENORIGUAL); }
">" { return symbolFactory.newSymbol(yytext(), MAIOR); }
">=" { return symbolFactory.newSymbol(yytext(), MAIORIGUAL); }

";" { return symbolFactory.newSymbol(yytext(),  PONTOVIRGULA); }
"." { return symbolFactory.newSymbol(yytext(),  PONTO); }
"," { return symbolFactory.newSymbol(yytext(),  VIRGULA); }
"(" { return symbolFactory.newSymbol(yytext(),  ABREPAR); }
")" { return symbolFactory.newSymbol(yytext(),  FECHAPAR); }
"{" { return symbolFactory.newSymbol(yytext(),  ABRECHAVES); }
"}" { return symbolFactory.newSymbol(yytext(),  FECHACHAVES); }
"[" { return symbolFactory.newSymbol(yytext(),  ABRECOL); }
"]" { return symbolFactory.newSymbol(yytext(),  FECHACOL); }
"=" { return symbolFactory.newSymbol(yytext(),  ATRIBUI); }

"PUBLIC" { return symbolFactory.newSymbol(yytext(),  PUBLIC); }
"CLASS" { return symbolFactory.newSymbol(yytext(),  CLASS); }
"EXTENDS" { return symbolFactory.newSymbol(yytext(),  EXTENDS); }
"STATIC" { return symbolFactory.newSymbol(yytext(),  STATIC); }
"VOID" { return symbolFactory.newSymbol(yytext(),  VOID); }
"BOOLEAN" { return symbolFactory.newSymbol(yytext(),  BOOLEAN); }
"MAIN" { return symbolFactory.newSymbol(yytext(),  MAIN); }
"STRING" { return symbolFactory.newSymbol(yytext(),  STRING); }
"INT" { return symbolFactory.newSymbol(yytext(),  INT); }
"WHILE" { return symbolFactory.newSymbol(yytext(),  WHILE); }
"IF" { return symbolFactory.newSymbol(yytext(),  IF); }
"ELSE" { return symbolFactory.newSymbol(yytext(),  ELSE); }
"RETURN" { return symbolFactory.newSymbol(yytext(),  RETURN); }
"LENGTH" { return symbolFactory.newSymbol(yytext(),  LENGTH); }
"THIS" { return symbolFactory.newSymbol(yytext(),  THIS); }
"NEW" { return symbolFactory.newSymbol(yytext(),  NEW); }
"SYSTEMOUTPRINTLN" { return symbolFactory.newSymbol(yytext(),  SYSTEMOUTPRINTLN); }

{espaco} { }
{comentarios} { }

. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
